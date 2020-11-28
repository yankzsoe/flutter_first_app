import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String email = '';
  final emailController = TextEditingController();

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
    DateTime dt = new DateTime.now();
    DateTime odt = new DateTime(2020, 11, 17);
    return MaterialApp(
      title: "latihan 1",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // DateFormat('yyyy-MM-dd').format(dt),
              // DateFormat.yMMMMd().format(odt),
              NumberFormat('#,###.0##', 'en-US').format(1234.567),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            )
          ],
        ),
      )),
    );
  }
}
