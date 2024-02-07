import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  void _addTransaction({required String title, required double amount}) {
    final newTransaction = Transaction(
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: title);
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransation(addTransaction: _addTransaction),
      TransactionList(transactions: _userTransactions),
    ]);
  }
}
