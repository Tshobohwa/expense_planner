import './transaction.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Expense planner"),
        ),
        body: Column(
          children: <Widget>[
            const Card(
              elevation: 5,
              color: Colors.blue,
              child: SizedBox(width: double.infinity, child: Text("CART!")),
            ),
            Column(
              children: [
                ...(transactions.map((transaction) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
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
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(transaction.date
                                    .toIso8601String()
                                    .split('.')[0]),
                                Text(transaction.title)
                              ],
                            ))
                      ]),
                    ),
                  );
                }))
              ],
            )
          ],
        ));
  }
}
