import './widgets/transaction_list.dart';

import './widgets/new_transaction.dart';

import 'package:flutter/material.dart';

import '././models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return NewTransaction(addTransaction: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Expense planner"),
          actions: [
            IconButton(
                onPressed: () => startAddNewTransaction(context),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ]),
      body: Column(
        children: <Widget>[
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: SizedBox(width: double.infinity, child: Text("CART!")),
          ),
          TransactionList(transactions: _userTransactions)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
