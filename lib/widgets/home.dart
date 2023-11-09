import 'package:ewallet/widgets/makepayment.dart';
import 'package:ewallet/widgets/rechargehistory.dart';
import 'package:ewallet/widgets/tarnsaction.dart';
import 'package:flutter/material.dart';

class MyWidgetHome extends StatelessWidget {
   MyWidgetHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Column(
        children: [
          Text("Home"),
        ],
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
            icon: Icon(Icons.receipt,color: Colors.deepPurple),
            label: 'Recharge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows,color: Colors.deepPurple),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment,color: Colors.deepPurple),
            label: 'Make Payment',
          ),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetRecharge()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetTransaction()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetMakePayment()));
          }
        },
      ),
    );
  }
}
