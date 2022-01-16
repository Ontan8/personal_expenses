import 'dart:io';
import 'package:expenses/widgets/input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './models/transaction.dart';
import './widgets/transactions_list.dart';
import './widgets/chart.dart';

//ignore_for_file: prefer_const_constructors
//ignore_for_file: use_key_in_widget_constructors
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
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
            textTheme: TextTheme(
              headline6: TextStyle(fontFamily: 'OpenSans'),
            ),
            errorColor: Colors.red));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showChart = true;
  //main list which holds the transactions
  final List<Transaction> userTransaction = [];

//getter to get the transactions of last 7 days for the chart widget
  List<Transaction> get _recentTransactions {
    return userTransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

//function that will be executed when the Add transactions button is pressed
  void _addTransactions(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      userTransaction.add(newTx);
    });
  }

//function that will be executed when the floating action point button of appbar action icon is pressed, this brings up the sheet to add new transactions
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

  void deleteTransaction(String id) {
    setState(() {
      userTransaction.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text('Expense Planner'),
      actions: [
        IconButton(
          onPressed: () => _startAddTransactions(context),
          icon: Icon(Icons.add),
        )
      ],
    );
    final transactionListWidget = SizedBox(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: TransactionsList(userTransaction, deleteTransaction));
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Show Chart'),
                    Switch(
                        value: showChart,
                        onChanged: (val) {
                          setState(() {
                            showChart = val;
                          });
                        })
                  ],
                ),
              if (!isLandscape)
                SizedBox(
                  child: Chart(_recentTransactions),
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                ),
              if (!isLandscape) transactionListWidget,
              if (isLandscape)
                showChart
                    ? SizedBox(
                        child: Chart(_recentTransactions),
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.7,
                      )
                    : transactionListWidget,
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Platform.isIOS
            ? SizedBox()
            : FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => _startAddTransactions(context),
              ));
  }
}
