import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(toolbarHeight: 0,),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: (MediaQuery.of(context).size.height)*0.3,
                        color: Colors.orange,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: IconButton(icon: Icon(Icons.arrow_back_ios_outlined), onPressed: () {
                                    Navigator.pop(context);
                                  }),
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Text('Profile', style: TextStyle(fontSize: 20), textAlign: TextAlign.left,)),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(icon: Icon(Icons.edit), onPressed: () {
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(height: 60,),
                            CircleAvatar(radius: 50,
                              backgroundImage:
                              NetworkImage("https://media-exp1.licdn.com/dms/image/C4D03AQFNGC4KjV3rPQ/profile-displayphoto-shrink_200_200/0/1621795322300?e=1634774400&v=beta&t=lGlcO8USq2opow6PYNPs4V49RVeA3VqbnCPEKXmzHA0"),
                              backgroundColor: Colors.transparent,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name'),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: (MediaQuery.of(context).size.width)*0.4,
                                    height: 40,
                                    color: Colors.grey[200],
                                  ),
                                  Text('Yash'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Phone Number'),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: (MediaQuery.of(context).size.width)*0.4,
                                        height: 40,
                                        color: Colors.grey[200],
                                      ),
                                      Text('8976205780'),
                                    ],
                                  ),
                                ],
                              ),
                             ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Location'),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: (MediaQuery.of(context).size.width)*0.4,
                                    height: 40,
                                    color: Colors.grey[200],
                                  ),
                                  Text('New York City'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Interest'),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: (MediaQuery.of(context).size.width)*0.4,
                                        height: 40,
                                        color: Colors.grey[200],
                                      ),
                                      Text('Football'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Row(
                      children: [
                        Expanded(flex:1, child: Text('Notifications')),
                        Expanded(flex: 1, child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.toggle_on_outlined),
                          ],
                        ),),
                      ],
                    ),
                  )
                ]
            )
        )
    );
  }
}
