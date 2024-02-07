class Transaction {
  String id;
  double amount;
  DateTime date;
  String title;

  Transaction(
      {required this.amount,
      required this.date,
      required this.id,
      required this.title});
}
