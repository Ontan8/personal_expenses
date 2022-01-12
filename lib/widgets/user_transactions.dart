import 'package:flutter/material.dart';
import './inputForm.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

//ignore_for_file: prefer_const_constructors
class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> userTransaction = [
    Transaction(
      id: '1',
      title: 'Graphics Card',
      amount: 470,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Mexican Pasta Pizza',
      amount: 252,
      date: DateTime.now(),
    )
  ];

  void _addTransactions(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputForm(),
        TransactionsList(userTransaction),
      ],
    );
  }
}
