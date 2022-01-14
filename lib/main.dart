import 'package:expenses/widgets/input_form.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transactions_list.dart';

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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final amountController = TextEditingController();

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

  void _startAddTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: InputForm(_addTransactions),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
          actions: [
            IconButton(
              onPressed: () => _startAddTransactions(context),
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
                  padding: EdgeInsets.all(10),
                ),
                elevation: 10,
                color: Colors.blue,
              ),
              TransactionsList(userTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddTransactions(context),
        ));
  }
}
