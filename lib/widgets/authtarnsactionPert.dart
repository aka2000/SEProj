import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/widgets/AuthDispatchHistory.dart';
import 'package:ewallet/widgets/AuthRechargehistory.dart';
import 'package:ewallet/widgets/authhome.dart';
import 'package:ewallet/widgets/authtarnsaction.dart';
import 'package:flutter/material.dart';

class MyWidgetAuthTransactionPer extends StatefulWidget {
  final String username;
  MyWidgetAuthTransactionPer({required this.username});

  @override
  _MyWidgetAuthTransactionPerState createState() =>
      _MyWidgetAuthTransactionPerState();
}

class _MyWidgetAuthTransactionPerState
    extends State<MyWidgetAuthTransactionPer> {
  final TextEditingController _emailController = TextEditingController();
  final CollectionReference transaction_details =
      FirebaseFirestore.instance.collection('transaction_details');

  late List<DocumentSnapshot> transactions;

  @override
  void initState() {
    super.initState();
    transactions = []; // Initialize transactions list
  }

  void _searchTransactions() async {
    // Reset transactions list
    setState(() {
      transactions = [];
    });

    // Fetch transactions based on emailController
    QuerySnapshot querySnapshot = await transaction_details
        .where('sender_id', isEqualTo: _emailController.text)
        .get();

    querySnapshot.docs.forEach((doc) {
      setState(() {
        transactions.add(doc);
      });
    });

    querySnapshot = await transaction_details
        .where('reciever_id', isEqualTo: _emailController.text)
        .get();

    querySnapshot.docs.forEach((doc) {
      setState(() {
        transactions.add(doc);
      });
    });
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
              onPressed: () {}, icon: const Icon(Icons.power_rounded))
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email Address",
              ),
            ),
            GestureDetector(
              onTap: _searchTransactions,
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(10),
                child: Text("Search"),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot trans_snap = transactions[index];
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    shadowColor: Colors.amber,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: ListTile(
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            leading: trans_snap['sender_id'] == _emailController.text
                                ? Icon(Icons.west)
                                : Icon(Icons.east),
                            title: Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Amount " +
                                            trans_snap['amount'].toString(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        trans_snap['time_day'].toString(),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            trailing: Column(
                              children: [
                                CircleAvatar(),
                                Text(
                                  trans_snap['sender_id'] == _emailController.text
                                      ? trans_snap['reciever_id']
                                      : trans_snap['sender_id'],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.deepPurple),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, color: Colors.deepPurple),
            label: 'Recharge History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows, color: Colors.deepPurple),
            label: 'Transaction History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows, color: Colors.deepPurple),
            label: 'Personal Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment, color: Colors.deepPurple),
            label: 'Dispatch History',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetAuthHome(username: widget.username)));
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetAuthRechargeHistory(username: widget.username)));
          } else if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetAuthTransaction(username: widget.username)));
          } else if (index == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetAuthTransactionPer(username: widget.username)));
          } else if (index == 4) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetDispatchHistory(username: widget.username)));
          }
        },
      ),
    );
  }
}
