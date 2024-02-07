import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> transactions = [
    Transaction(
        amount: 14.00, date: DateTime.now(), id: 't1', title: "12.5kg rice"),
    Transaction(
        amount: 20.00, date: DateTime.now(), id: 't2', title: "New shoes"),
    Transaction(
        amount: 10.99, date: DateTime.now(), id: 't3', title: "Computer cable"),
    Transaction(
        amount: 45.00,
        date: DateTime.now(),
        id: 't4',
        title: "Computer battery"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...(transactions.map((transaction) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            color: Colors.blue[200],
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(children: [
                SizedBox(
                    width: 140,
                    height: 70,
                    child: Center(
                      child: Text(
                        '\$${transaction.amount}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                    )),
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(transaction.title),
                        Text(
                          DateFormat('dd/MM/yyyy')
                              .format(transaction.date)
                              .toString(),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ))
              ]),
            ),
          );
        })).toList()
      ],
    );
  }
}
