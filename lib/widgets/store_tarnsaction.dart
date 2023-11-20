import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/widgets/dispatch.dart';
import 'package:ewallet/widgets/home.dart';
import 'package:flutter/material.dart';


class MyWidgetStoreTransaction extends StatelessWidget {
  final String username;
   MyWidgetStoreTransaction({required this.username});
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
                  if(username == trans_snap['sender_id']){
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
                                  child: Text("Amount " + trans_snap['amount'].toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(trans_snap['time_day'].toString()),
                                )
                              ],
                            )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            
                            CircleAvatar(),
                            Text(trans_snap['reciever_id']),
                            
                            

                        ]),
                      ),
                    ),
                  ] ,
                ),
              ),
            );

            }
            else if(username == trans_snap['reciever_id']){
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
                        leading: Icon(Icons.east),
                        title: Column(
                          children: [
                            Column(
                              
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Amount " + trans_snap['amount'].toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(trans_snap['time_day'].toString()),
                                )
                              ],
                            )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            
                            CircleAvatar(),
                            Text(trans_snap['sender_id']),
                            
                            

                        ]),
                      ),
                    ),
                  ] ,
                ),
              ),
            );

            }
            else{
              return Container();
            }
                  
                },
                );
            }
            return Container();
        },
        ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.deepPurple),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows,color: Colors.deepPurple),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard,color: Colors.deepPurple),
            label: 'Dispatch',
          )
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetHome(username: username)));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetStoreTransaction(username: username)));
          } 
          else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetDispatch(username: username)));
          } 
        },
      ),
    );
  }
}
