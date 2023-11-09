import 'package:flutter/material.dart';
import 'package:ewallet/widgets/login.dart';
import 'package:ewallet/widgets/signup.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:ewallet/widgets/home.dart';
import 'package:ewallet/widgets/tarnsaction.dart';
import 'package:ewallet/widgets/tarnsaction.dart';

void main(){
 // WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Wallet",
      home: MyWidgetHome(), 
    );
  }
}