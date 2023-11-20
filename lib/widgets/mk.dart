import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/widgets/home.dart';
import 'package:ewallet/widgets/makepayment.dart';
import 'package:ewallet/widgets/rechargehistory.dart';
import 'package:ewallet/widgets/tarnsaction.dart';
import 'package:flutter/material.dart';

class MyWidgetpayment extends StatefulWidget {
  final String username;
  final String userEmail;
  final TextEditingController pincontroller = TextEditingController();
  final TextEditingController amountcontroller = TextEditingController();
  final CollectionReference transaction_details =
      FirebaseFirestore.instance.collection('transaction_details');
  final CollectionReference user_details =
      FirebaseFirestore.instance.collection('user_details');

  MyWidgetpayment({required this.username, required this.userEmail});

  @override
  _MyWidgetpaymentState createState() => _MyWidgetpaymentState();
}

class _MyWidgetpaymentState extends State<MyWidgetpayment> {
  String senderName = '';
  String senderEmail = '';
  String senderMpin = '';
  int senderBalance = 0;
  String SenderId = '';

  String receiverName = '';
  String receiverEmail = '';
  int receiverBalance = 0;
  String recieverId = '';

  @override
  void initState() {
    super.initState();
    _getSenderDetails();
    _getReceiverDetails();
  }

  void _getSenderDetails() async {
    String enteredEmail = widget.username;

    if (enteredEmail.isNotEmpty) {
      QuerySnapshot querySnapshot = await widget.user_details
          .where('email', isEqualTo: enteredEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;

        setState(() {
          senderName = userSnapshot['name'];
          senderEmail = userSnapshot['email'];
          senderMpin = userSnapshot['mpin'];
          senderBalance = userSnapshot['Balance'];
          SenderId = userSnapshot.id;
        });
      } else {
        print("Sender details not found");
      }
    } else {
      print("Invalid sender email");
    }
  }

  void _getReceiverDetails() async {
    String enteredEmail = widget.userEmail;

    if (enteredEmail.isNotEmpty) {
      QuerySnapshot querySnapshot = await widget.user_details
          .where('email', isEqualTo: enteredEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;

        setState(() {
          receiverName = userSnapshot['name'];
          receiverEmail = userSnapshot['email'];
          receiverBalance = userSnapshot['Balance'];
          recieverId = userSnapshot.id;
        });
      } else {
        print("Receiver details not found");
      }
    } else {
      print("Invalid receiver email");
    }
  }

  // Function to perform payment and update balances
  void _performPayment() async {
    int amount = int.tryParse(widget.amountcontroller.text) ?? 0;
    String enteredMPin = widget.pincontroller.text;

    if (amount <= 0) {
      print("Invalid amount");
      return;
    }

    // Check if the entered MPin matches the sender's MPin
    if (enteredMPin != senderMpin) {
      print("Incorrect MPin");
      return;
    }

    // Check if the sender has sufficient balance
    if (senderBalance < amount) {
      print("Insufficient balance");
      return;
    }

    // Perform the payment
    int newSenderBalance = senderBalance - amount;
    int newReceiverBalance = receiverBalance + amount;

    // Update sender's balance in the database using senderId
    await widget.user_details.doc(SenderId).update({
      'Balance': newSenderBalance,
    });

    // Update receiver's balance in the database using receiverId
    await widget.user_details.doc(recieverId).update({
      'Balance': newReceiverBalance,
    });

    // Refresh sender and receiver details after the payment
    _getSenderDetails();
    _getReceiverDetails();

    // Add transaction details
    await addTransaction(newSenderBalance, newReceiverBalance, amount);

    // Optionally, you can navigate to a success screen or show a success message
    print("Payment successful");

     // Go back after payment
  }

  // Function to add transaction details
  Future<void> addTransaction(
      int newSenderBalance, int newReceiverBalance, int amount) async {
    final data = {
      'amount': amount,
      'reciever_balance': newReceiverBalance,
      'reciever_id': receiverEmail,
      'sender_balance': newSenderBalance,
      'sender_id': senderEmail,
      'time_day': '12/12/2023',
    };

    await widget.transaction_details.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Wallet"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded)),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        elevation: 10,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sender Name: $senderName"),
                  Text("Receiver Name: $receiverName"),
                  Text("Sender Balance: $senderBalance"),
                  TextField(
                    controller: widget.amountcontroller,
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                  ),
                  TextField(
                    controller: widget.pincontroller,
                    decoration: InputDecoration(
                      labelText: "Enter Your MPin",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _performPayment,
                    child: Text("Pay"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to the previous screen
                    },
                    child: Text("Back"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.deepPurple),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, color: Colors.deepPurple),
            label: 'Recharge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows, color: Colors.deepPurple),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment, color: Colors.deepPurple),
            label: 'Make Payment',
          ),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetRecharge(username: widget.username)));
          }
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetHome(username: widget.username)));
          } else if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetTransaction(username: widget.username)));
          } else if (index == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetMakePayment(username: widget.username)));
          }
        },
      ),
    );
  }
}
