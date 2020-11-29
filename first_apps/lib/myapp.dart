import 'package:first_apps/TransactionList.dart';
import 'package:first_apps/transaction.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();
  Transaction transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "latihan 1",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
                minimum: EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        controller: _contentController,
                        decoration: InputDecoration(labelText: 'Content'),
                        onChanged: (text) {
                          setState(() {
                            transaction.content = text;
                          });
                        },
                      ),
                      TextField(
                        controller: _amountController,
                        decoration: InputDecoration(labelText: 'Amount(money)'),
                        onChanged: (text) {
                          setState(() {
                            transaction.amount = double.tryParse(text) ?? 0;
                          });
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10)),
                      ButtonTheme(
                        height: 50,
                        child: FlatButton(
                            textColor: Colors.amber[300],
                            color: Colors.blue,
                            child: Text(
                              'Insert Transaction',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              setState(() {
                                _transactions.add(transaction);
                                transaction =
                                    Transaction(content: '', amount: 0.0);
                                _contentController.text = '';
                                _amountController.text = '';
                              });
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(_transactions.toString()),
                                duration: Duration(seconds: 1),
                              ));
                            }),
                      ),
                      TransactionList(transactions: _transactions)
                    ],
                  ),
                ))));
  }
}
