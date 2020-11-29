import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({this.transactions});
  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: (index - 1) % 2 == 0 ? Colors.green[200] : Colors.green[300],
            elevation: 10,
            child: ListTile(
              leading: const Icon(Icons.access_alarms),
              title: Text('${transactions[index].content}'),
              subtitle: Text('${transactions[index].amount}'),
              onTap: () {
                print('clicked me');
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: 500, child: _buildListView());
  }
}
