import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackerkernel/user.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email='';
  String password='';
  bool hide = true;
  String error = "";
  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height)*0.3,
                  color: Colors.orange,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(radius: 40, backgroundColor: Colors.transparent, child: Stack(children:[
                        Icon(Icons.all_inclusive_outlined, color: Colors.white, size: 80,),
                        Transform.rotate(
                            angle: 90 *3.14 /180,
                            child: Icon(Icons.all_inclusive_outlined, color: Colors.white, size: 80, )),
                      ]),
                      ),
                      SizedBox(height: 10,),
                      Text('KARMA', style: GoogleFonts.ubuntu(fontSize: 25, color: Colors.white),),
                      Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: Container(height: 0.5, width: 60, color: Colors.white,),
                      ),
                      Text('UNITING POWER', style: TextStyle(fontSize: 8, color: Colors.white),),
                      SizedBox(height: 5,),
                      Text('LOGIN', style: TextStyle(fontSize: 15, color: Colors.white),)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            hintText: 'Email',
                            fillColor: Colors.grey[200],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange, width: 2.0)
                            ),
                          ),
                          validator: (val) => val.isEmpty ? 'Enter Email' : null,
                          onChanged: (val){
                            setState(() => email = val);
                          }
                      ),
                      SizedBox(height:40.0),
                      Stack(
                        children: [
                          TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                hintText: 'Password',
                                fillColor: Colors.grey[200],
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 2.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)
                                ),
                              ),
                              obscureText: hide,
                              validator: (val) => val.length<6 ? 'Password length should be greater than 6' : null,
                              onChanged: (val){
                                setState(() => password = val);
                              }
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 4.0, 16.0, 4.0),
                                child: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: () {
                                  setState(() {
                                    hide?hide=false:hide=true;
                                  });
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forgot Password', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 80,),
                      Text(error, style: TextStyle(color: Colors.red),),
                      SizedBox(height: 10,),
                      ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                                setState(() {
                                });
                                Future<User> login() async {
                                  final http.Response response = await http.post(
                                    Uri.parse('https://reqres.in/api/login'),
                                    headers: {
                                      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
                                    },
                                    body: jsonEncode(<String, dynamic>{
                                      "email": email,
                                      "password": password
                                    }),
                                  );
                                  print(jsonDecode(response.body));
                                  print(response.statusCode);
                                  if(response.statusCode==200){
                                    setState(() {
                                      error='Success';
                                      widget.toggleView();
                                    });
                                  }
                                  else{
                                    setState(() {
                                      error='Login Failed';
                                    });
                                  }
                                  return User.fromJson(jsonDecode(response.body));
                                }
                                await login();
                            }
                            else{
                              setState(() {
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(36.0, 12.0, 36.0, 12.0),
                            child: Text('Login'),
                          )
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Not a member yet? '),
                          TextButton(onPressed: () {}, child: Text(' Click Here'))
                        ],
                      )
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.orange;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
