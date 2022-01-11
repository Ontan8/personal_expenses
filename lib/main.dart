import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: '1', title: 'Graphics Card', amount: 47000, date: DateTime.now()),
    Transaction(
        id: '2',
        title: 'Mexican Pasta Pizza',
        amount: 252,
        date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
              child: Text(
                'Chart',
                textAlign: TextAlign.center,
              ),
              width: double.infinity,
            ),
            elevation: 10,
            color: Colors.blue,
          ),
          Container(
            child: Card(
              child: Text(
                'List of Transactions',
                textAlign: TextAlign.center,
              ),
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
