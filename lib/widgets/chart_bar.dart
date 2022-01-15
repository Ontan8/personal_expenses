import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(this.label, this.spendingAmount, this.spendingPercentage,
      {Key? key})
      : super(key: key);
  final String label;
  final double spendingAmount;
  final double spendingPercentage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                heightFactor: spendingPercentage,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}