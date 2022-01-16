import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

//ignore_for_file: prefer_const_constructors

class TransactionsList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransaction;
  const TransactionsList(this.transaction, this.deleteTransaction, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: transaction.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text('No Transactions Added Yet'),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FittedBox(
                            child: Text(transaction[index].amount.toString())),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? TextButton.icon(
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                deleteTransaction(transaction[index].id),
                            label: Text('Delete'),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor)),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () {
                              deleteTransaction(transaction[index].id);
                            },
                          ),
                  ),
                );
              },
            ),
    );
  }
}
