// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';

class MyWidget5 extends StatelessWidget {
  const MyWidget5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // app bar
        appBar: AppBar(
          title: Text("E-Wallet"),
          backgroundColor: Colors.deepPurple,
        ),

        body: ListView(
          children: const [
            Padding(
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
                        leading: Icon(Icons.east_outlined),
                        title: Column(
                          children: [
                            Column(
                              
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Amount"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Date"),
                                )
                              ],
                            )
                          ],
                        ),
                        //trailing: Text("Aswin U"),
                        trailing: Column(
                          children: [
                            CircleAvatar(),
                            Text("Aswin U")

                        ]),
                        
                      ),
                    ),
                  ] ,
                ),
              ),
            ),
            Padding(
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
                                  child: Text("Amount"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Date"),
                                )
                              ],
                            )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            
                            CircleAvatar(),
                            Text("Aswin U"),
                            
                            

                        ]),
                      ),
                    ),
                  ] ,
                ),
              ),
            )

        ],
        )
      );
  }
}

