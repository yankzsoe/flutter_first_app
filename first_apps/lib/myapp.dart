import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  final name;
  final age;
  MyApp({this.name, this.age});

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
    print('run initState()');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('run dispose()');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('App is background mode');
    } else if (state == AppLifecycleState.resumed) {
      print('App is foreground mode');
    } else {
      print(state.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    print('run build()');
    return MaterialApp(
      title: "latihan 1",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: emailController,
                onChanged: (text) {
                  this.setState(() {
                    email = text;
                  });
                },
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(17))),
                    labelText: 'Email Address'),
              ),
            ),
            Text(
              "${widget.name} ${widget.age}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
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
