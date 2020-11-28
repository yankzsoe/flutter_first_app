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
  String _content;
  double _amount;
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: _contentController,
                      decoration: InputDecoration(labelText: 'Content'),
                      onChanged: (text) {
                        setState(() {
                          _content = text;
                        });
                      },
                    ),
                    TextField(
                      controller: _amountController,
                      decoration: InputDecoration(labelText: 'Amount(money)'),
                      onChanged: (text) {
                        setState(() {
                          _amount = double.tryParse(text) ?? 0;
                        });
                      },
                    ),
                    FlatButton(
                        textColor: Colors.amber[300],
                        color: Colors.blue,
                        child: Text('Insert Transaction'),
                        onPressed: () {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                'Content = $_content and Amount = $_amount'),
                            duration: Duration(seconds: 1),
                          ));
                        })
                  ],
                ))));
  }
}
