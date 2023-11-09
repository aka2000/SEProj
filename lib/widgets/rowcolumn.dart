import 'package:flutter/material.dart';

class MyWidget1 extends StatelessWidget {
  const MyWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // app bar
        appBar: AppBar(
          title: const Text("E-Wallet"),
          backgroundColor: Colors.deepPurple,
          //leading: Icon(Icons.menu),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10)
          )),
          elevation: 10,
        ),

        body:Row(
          children: [
            Container(
              width: 100,
              height: 50,
              color: Colors.deepPurple,
            ),
            Container(
              width: 200,
              height: 50,
              color: Colors.black,
            ),
            Container(
              width: 200,
              height: 50,
              color: Colors.deepPurple,
            )
          ],
        )
      );
  }
}

