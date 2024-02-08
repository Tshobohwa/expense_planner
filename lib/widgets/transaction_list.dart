import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({required this.transactions, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  color: Theme.of(context).primaryColorLight,
                  child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Row(children: [
                        SizedBox(
                            width: 140,
                            height: 70,
                            child: Center(
                              child: Text(
                                '\$${transactions[index].amount}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(transactions[index].title),
                                  Text(
                                    DateFormat('dd/MM/yyyy')
                                        .format(transactions[index].date)
                                        .toString(),
                                    style: const TextStyle(color: Colors.grey),
                                  )
                                ]))
                      ])));
            }));
  }
}
