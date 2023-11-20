import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyWidget4 extends StatefulWidget {
  @override
  _MyWidget4State createState() => _MyWidget4State();
}

class _MyWidget4State extends State<MyWidget4> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _mobileNumberController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _mpinController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final user_type = ['Student/Faculty/Staff', 'Store'];
  String? user_type_selected;

  @override
  Widget build(BuildContext context) {
    final CollectionReference user_details =
        FirebaseFirestore.instance.collection('user_details');

    void addUser() async {
      final data = {
        'Balance': 0,
        'Mobile_number': _mobileNumberController.text,
        'email': _emailController.text,
        'mpin': _mpinController.text,
        'name': _nameController.text,
        'roll_no': _rollNoController.text,
        'usertype': user_type_selected
      };
      await user_details.add(data);
    }

    Future<void> registerUser() async {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // If user registration is successful, add additional details to Firestore
        addUser();
        Navigator.pop(context); // Navigate back after successful registration
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // If the email is already in use, show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email is already in use")),
          );
        } else {
          // Handle other registration errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${e.message}")),
          );
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Set Password",
                    ),
                  ),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                    ),
                  ),
                  TextField(
                    controller: _mobileNumberController,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  TextField(
                    controller: _rollNoController,
                    decoration: InputDecoration(
                      labelText: "Roll Number",
                    ),
                  ),
                  TextField(
                    controller: _mpinController,
                    decoration: InputDecoration(
                      labelText: "Mpin",
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(label: Text("User Type")),
                    items: user_type
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      user_type_selected = val as String?;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        registerUser();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Password Mismatch")),
                        );
                      }
                    },
                    child: Text("Register"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
