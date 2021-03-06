import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//ignore_for_file: prefer_const_constructors
class InputForm extends StatefulWidget {
  final Function funcc;
  const InputForm(this.funcc, {Key? key}) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InputForm oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  final textController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? selectedDate;
  void sendData() {
    if (amountController.text.isEmpty) {
      return;
    }
    if (textController.text.isEmpty ||
        double.parse(amountController.text) <= 0 ||
        selectedDate == null) {
      return;
    }
    widget.funcc(
        textController.text, double.parse(amountController.text), selectedDate);
    Navigator.of(context).pop();
  }

  void datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
            Row(
              children: [
                Text(selectedDate == null
                    ? 'No Date Chosen'
                    : 'Date Selected: ${DateFormat.yMd().format(selectedDate!)}'),
                TextButton(
                  onPressed: datePicker,
                  child: Text(
                    'Select a Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ElevatedButton(
                onPressed: () => sendData(),
                child: Text('Add Transaction'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
