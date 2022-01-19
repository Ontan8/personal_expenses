import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';
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
                return TransactionItem(
                    transaction: transaction[index],
                    deleteTransaction: deleteTransaction);
              },
            ),
    );
  }
}
