import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/widgets/authhome.dart';
import 'package:ewallet/widgets/home.dart';
import 'package:ewallet/widgets/store_home.dart';
import 'package:flutter/material.dart';

class MyWidgetIntermediate extends StatelessWidget {
  final String username;

  MyWidgetIntermediate({required this.username});

  @override
  Widget build(BuildContext context) {
    final CollectionReference user_details =
        FirebaseFirestore.instance.collection('user_details');
    return StreamBuilder(
      stream: user_details.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          final userSnap = snapshot.data!.docs.firstWhere(
            (QueryDocumentSnapshot<Object?> doc) => doc['email'] == username,
          );

          if (userSnap != null) {
            final userType = userSnap['usertype'];

            if (userType == 'Student/Faculty/Staff') {
              return MyWidgetHome(username: username);
            } else if (userType == 'Store') {
              return MyWidgetStoreHome(username: username);
            }
            else if (userType == 'mainAuth') {
              return MyWidgetAuthHome(username: username);
            }
          }
        }

        // If user is not found or usertype is not recognized, you can handle it accordingly
        return Container(
          child: Text('User not found or usertype not recognized.'),
        );
      },
    );
  }
}
