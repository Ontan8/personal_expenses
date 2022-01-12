import 'package:flutter/material.dart';
import './widgets/transactions_list.dart';
import './widgets/inputForm.dart';

//ignore_for_file: prefer_const_constructors
//ignore_for_file: use_key_in_widget_constructors
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
  final textController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Card(
            child: InputForm(),
          ),
          TransactionsList(),
        ],
      ),
    );
  }
}
