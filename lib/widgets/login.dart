// ignore_for_file: prefer_const_constructors
import 'package:ewallet/widgets/signup.dart';

import 'dart:math';

import 'package:flutter/material.dart';

class MyWidget2 extends StatelessWidget {
   MyWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // app bar
        appBar: AppBar(
          title: Text("E-Wallet"),
          backgroundColor: Colors.deepPurple,
        ),

        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                TextField(
                  decoration: InputDecoration(
                    labelText: "E-mail"
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password"
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(double.infinity,40))
                  ),
                  onPressed: () {}, child: Text("Sign In")
                  ),
                  SizedBox(
                  height: 10,
                ),
                //TextButton(onPressed: ()  {}, child: Text("Register"))
                TextButton(
                            onPressed: () {
                                          Navigator.push(
                                                        context,MaterialPageRoute(builder: (context) => MyWidget4()), // Navigate to the signup screen
                                                         );
                                          },child: Text("Register"),
                            ),

              ],
            ),
          ),
        ),
      );
  }
}
