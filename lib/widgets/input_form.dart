import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
class InputForm extends StatelessWidget {
  final textController = TextEditingController();
  final amountController = TextEditingController();
  final Function funcc;
  void sendData() {
    if (textController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
      return;
    }
    funcc(textController.text, double.parse(amountController.text));
  }

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
            keyboardType: TextInputType.text,
            onSubmitted: (_) => sendData(),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => sendData(),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: TextButton(
              onPressed: () => sendData(),
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
