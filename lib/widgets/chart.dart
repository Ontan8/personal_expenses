import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {Key? key}) : super(key: key);
  final List<Transaction> recentTransactions;
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i in recentTransactions) {
        if (i.date.day == weekDay.day &&
            i.date.month == weekDay.month &&
            i.date.year == weekDay.year) {
          totalSum += i.amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [Column()],
      ),
    );
  }
}
