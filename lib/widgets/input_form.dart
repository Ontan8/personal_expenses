import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
class InputForm extends StatelessWidget {
  String? textVal;
  double? amountVal;
  final textController = TextEditingController();
  final amountController = TextEditingController();
  final Function funcc;
  InputForm(this.funcc, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: textController,
            onChanged: (val) {
              textVal = val;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            onChanged: (val) {
              amountVal = double.parse(val);
            },
            controller: amountController,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: TextButton(
              onPressed: () => funcc(textVal, amountVal),
              child: Text('Add Transaction'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple)),
            ),
          ),
        ],
      ),
    );
  }
}
