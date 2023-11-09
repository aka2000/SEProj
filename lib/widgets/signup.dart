import 'package:flutter/material.dart';

class MyWidget4 extends StatelessWidget {
   MyWidget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // app bar
        appBar: AppBar(
          title: Text("E-Wallet"),
          backgroundColor: Colors.deepPurple,
        ),

        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    TextField(
                      maxLength: 17,
                      decoration: InputDecoration(
                        labelText: "Roll Number"
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Name"
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email Address"
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Mobile Number"
                      ),
                    ),
                    TextField(
                      maxLength: 4,
                      decoration: InputDecoration(
                        
                        labelText: "M-Pin"
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Set Password"
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm Password"
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(double.infinity,40))
                      ),
                      onPressed: () {}, child: Text("Register")
                      ),
                      SizedBox(
                      height: 10,
                    ),
                    //TextButton(onPressed: (){}, child: Text(" Already have an account Log In"))
                    TextButton(
                              onPressed: () {
                                        Navigator.pop(context); // Navigate back to the login screen
                                        },
                              child: Text("Already have an account? Log In"),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}