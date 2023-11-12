import 'package:flutter/material.dart';

class MyHome extends StatefulWidget{
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyWidgetState();

}

class _MyWidgetState extends State<MyHome>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Wallet"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        elevation: 10,
      )
    )
  }
}