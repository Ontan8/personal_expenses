import 'package:expenses/widgets/input_form.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transactions_list.dart';
import './widgets/chart.dart';

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
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            fontFamily: 'Quicksand',
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light()
                    .textTheme
                    .copyWith(headline6: TextStyle(fontFamily: 'OpenSans'))),
            textTheme:
                TextTheme(headline6: TextStyle(fontFamily: 'OpenSans'))));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> userTransaction = [];

  List<Transaction> get _recentTransactions {
    return userTransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
              Chart(_recentTransactions),
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
