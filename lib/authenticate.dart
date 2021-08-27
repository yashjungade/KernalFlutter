//If reqres authentication is successful then drives page screen UI toggled else login screen is toggled.

import 'package:flutter/material.dart';
import 'package:hackerkernel/drive.dart';
import 'package:hackerkernel/login.dart';
import 'package:hackerkernel/storage.dart';

class Authenticate extends StatefulWidget {
  //final CounterStorage storage;
  //Authenticate({this.storage});
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool login = true;
  //int value=0;
  void toggleView(){
    setState(() => login = !login);
  }
  @override
  Widget build(BuildContext context) {
    /*widget.storage.readCounter().then((int valueS){
      setState(() {
        value=valueS;
        print(valueS);
      });
    });*/
    if(login) {
      return LoginPage(toggleView: toggleView);
    } else{
      return Drive(toggleView: toggleView);
    }
  }
}