class Transaction {
  String content;
  double amount;
  DateTime createdDate;
  Transaction({this.content, this.amount, this.createdDate});
  @override
  String toString() {
    return 'content: $content, amont: $amount';
  }
}
