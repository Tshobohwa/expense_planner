import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  const NewTransaction({required this.addTransaction, super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void addTransactionHandler() {
    final title = titleController.text;
    final amount = amountController.text;

    if (title.isEmpty || amount.isEmpty) return;

    widget.addTransaction(
        title: titleController.text,
        amount: double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
      child: Column(children: [
        Container(
            margin: const EdgeInsets.all(5),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => addTransactionHandler(),
            )),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => addTransactionHandler(),
          ),
        ),
        TextButton(
            onPressed: addTransactionHandler,
            child: const Text(
              "add transaction",
              style: TextStyle(color: Colors.blue),
            ))
      ]),
    );
  }
}
