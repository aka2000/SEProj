import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/widgets/home.dart';
import 'package:ewallet/widgets/mk.dart';
import 'package:ewallet/widgets/rechargehistory.dart';
import 'package:ewallet/widgets/tarnsaction.dart';
import 'package:flutter/material.dart';

class MyWidgetMakePayment extends StatefulWidget {
  final String username;

  MyWidgetMakePayment({required this.username});

  @override
  _MyWidgetMakePaymentState createState() => _MyWidgetMakePaymentState();
}

class _MyWidgetMakePaymentState extends State<MyWidgetMakePayment> {
  final TextEditingController _emailController = TextEditingController();
  final CollectionReference user_details =
      FirebaseFirestore.instance.collection('user_details');

  String? userName;
  String? userEmail;

  // Function to handle search button press
  void _searchUser() async {
    String enteredEmail = _emailController.text.trim();

    if (enteredEmail.isNotEmpty) {
      QuerySnapshot querySnapshot =
          await user_details.where('email', isEqualTo: enteredEmail).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;

        // Update state to trigger UI update
        setState(() {
          userName = userSnapshot['name'];
          userEmail = userSnapshot['email'];
        });
      } else {
        // User not found
        setState(() {
          userName = null;
          userEmail = null;
        });
        print("User not found");
      }
    } else {
      // Email field is empty
      setState(() {
        userName = null;
        userEmail = null;
      });
      print("Please enter a valid email");
    }
  }

  // Function to handle card tap
  void _onCardTap() {
  if (userName != null && userEmail != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyWidgetpayment(
          username: widget.username,
          userEmail: userEmail!,
        ),
      ),
    );
  }
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
      body: Column(
        children: [
          Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Search User Mail",
                ),
              ),
              ElevatedButton(
                onPressed: _searchUser, // Call the search function on button press
                child: Text("Search"),
              ),
            ],
          ),
          // Display user details here based on the search result
          // Example UI (customize based on your data structure):
          userName != null && userEmail != null
              ? GestureDetector(
                  onTap: _onCardTap, // Call the function when the card is tapped
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Column(
                            children: [
                              Text("Name: $userName"),
                              Text("Email: $userEmail")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(), // Empty container if no user is found
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: 3,
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
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyWidgetHome(username: widget.username)));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyWidgetRecharge(username: widget.username)));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyWidgetTransaction(username: widget.username)));
          }
        },
      ),
    );
  }
}
