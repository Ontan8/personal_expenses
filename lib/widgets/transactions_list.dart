import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

//ignore_for_file: prefer_const_constructors

class TransactionsList extends StatelessWidget {
  final List<Transaction> transaction;
  const TransactionsList(this.transaction, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transaction.map((e) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(
                    '\$${e.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                        color: Colors.purple,
                        width: 2,
                        style: BorderStyle.solid),
                  ),
                  padding: EdgeInsets.all(8),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        e.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    Container(
                      child: Text(
                        DateFormat.yMMMMd('en_US').format(e.date),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
