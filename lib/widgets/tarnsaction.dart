import 'package:ewallet/widgets/home.dart';
import 'package:ewallet/widgets/makepayment.dart';
import 'package:ewallet/widgets/rechargehistory.dart';
import 'package:flutter/material.dart';


class MyWidgetTransaction extends StatelessWidget {
   MyWidgetTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Wallet"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.power_rounded))],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        elevation: 10,
      ),
      body: Column(
        children: [
          Text("Transaction"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: 2,
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
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetHome()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetRecharge()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidgetMakePayment()));
          }
        },
      ),
    );
  }
}
