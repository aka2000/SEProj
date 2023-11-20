import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/widgets/dispatch.dart';
import 'package:ewallet/widgets/store_tarnsaction.dart';
import 'package:flutter/material.dart';

class MyWidgetStoreHome extends StatelessWidget {
  final String username;

  MyWidgetStoreHome({required this.username});

  @override
  Widget build(BuildContext context) {
    final CollectionReference user_details =
        FirebaseFirestore.instance.collection('user_details');
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        elevation: 10,
      ),
      body: StreamBuilder(
        stream: user_details.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                if (index < snapshot.data.docs.length) {
                  final DocumentSnapshot user_snap = snapshot.data.docs[index];
                  if (username == user_snap['email']) {
                    return Column(
                      children: [
                        Text(user_snap['name']),
                        Text(user_snap['Mobile_number'].toString()),
                        Text(user_snap['email']),
                        Text("balance : " + user_snap['Balance'].toString())
                      ],
                    );
                  } else {
                    return Container();
                  }
                } else {
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetStoreHome(username: username)));
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
