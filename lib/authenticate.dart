import 'package:flutter/material.dart';
import 'package:hackerkernel/drive.dart';
import 'package:hackerkernel/login.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool login = true;
  void toggleView(){
    setState(() => login = !login);
  }
  @override
  Widget build(BuildContext context) {
    if(login) {
      return LoginPage(toggleView: toggleView);
    } else{
      return Drive(toggleView: toggleView);
    }
  }
}