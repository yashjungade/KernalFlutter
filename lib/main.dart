import 'package:flutter/material.dart';
import 'package:hackerkernel/authenticate.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karma',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Authenticate(),
    );
  }
}