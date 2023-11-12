import 'package:ewallet/widgets/home.dart';
import 'package:ewallet/widgets/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyWidget2 extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 40)),
                ),
                onPressed: () async {
                  try {
                    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                      email: usernameController.text,
                      password: passwordController.text,
                    );
                    // Navigate to the home page if the user was successfully signed in.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyWidgetHome()),
                    );
                  } on FirebaseAuthException catch (e) {
                    // Show an error message to the user if the sign in failed.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message ?? '')),
                    );
                  }
                },
                child: Text("Sign In"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _errorMessage ?? '',
                style: TextStyle(color: Colors.red),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyWidget4()),
                  );
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
