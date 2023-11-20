import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/widgets/AuthDispatchHistory.dart';
import 'package:ewallet/widgets/AuthRechargehistory.dart';
import 'package:ewallet/widgets/authhome.dart';
import 'package:ewallet/widgets/authtarnsactionPert.dart';
import 'package:flutter/material.dart';


class MyWidgetAuthTransaction extends StatelessWidget {
  final String username;
   MyWidgetAuthTransaction({required this.username});
  final CollectionReference transaction_details = FirebaseFirestore.instance.collection('transaction_details');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Wallet"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.power_rounded))],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        elevation: 10,
      ),
      body: StreamBuilder(
        stream: transaction_details.orderBy('time_day').snapshots(),
        builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  final DocumentSnapshot trans_snap = snapshot.data.docs[index];
                  
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
                        leading: Icon(Icons.west),
                        title: Column(
                          children: [
                            Column(
                              
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Amount : " + trans_snap['amount'].toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Sender : " + trans_snap['sender_id']),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Reciever : " + trans_snap['reciever_id']),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(trans_snap['time_day'].toString()),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ] ,
                ),
              ),
            );

            
                  
                },
                );
            }
            return Container();
        },
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
                    builder: (context) => MyWidgetAuthHome(username: username)));
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetAuthRechargeHistory(username: username)));
          } else if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetAuthTransaction(username: username)));
          }
          else if (index == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetAuthTransactionPer(username: username)));
          }
          else if (index == 4) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWidgetDispatchHistory(username: username)));
          }
        },
      ),
    );
  }
}
