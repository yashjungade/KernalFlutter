import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackerkernel/authenticate.dart';
import 'package:hackerkernel/drive.dart';
import 'package:hackerkernel/profile.dart';

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
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.orange,
      ),
      home: Authenticate(),
    );
  }
}