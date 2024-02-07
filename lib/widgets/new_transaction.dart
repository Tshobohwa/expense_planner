import 'package:flutter/material.dart';

class NewTransation extends StatelessWidget {
  NewTransation({super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Container(
            margin: const EdgeInsets.all(5),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Title"),
              controller: titleController,
            )),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Amount"),
            controller: amountController,
          ),
        ),
        TextButton(
            onPressed: () {
              print(titleController.text);
              print(amountController.text);
            },
            child: const Text(
              "add transaction",
              style: TextStyle(color: Colors.blue),
            ))
      ]),
    );
  }
}
