import 'package:flutter/material.dart';
import 'package:hackerkernel/profile.dart';

class Drive extends StatefulWidget {
  final Function toggleView;
  Drive({this.toggleView});
  @override
  _DriveState createState() => _DriveState();
}

class _DriveState extends State<Drive> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
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
                            child: IconButton(icon: Icon(Icons.account_circle_rounded), onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Profile()),
                              );
                            }),
                          ),
                          Expanded(
                            flex: 8,
                              child: Text('Karma Drives', style: TextStyle(fontSize: 20), textAlign: TextAlign.left,)),
                          Expanded(
                            flex: 1,
                            child: IconButton(icon: Icon(Icons.login), onPressed: () {
                              setState(() {
                                widget.toggleView();
                              });
                            }),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Stack(
                        children: [
                          TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                ),
                                contentPadding: EdgeInsets.all(20),
                                hintText: 'Search here...',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 6.0, 6.0, 4.0),
                                child: Stack(
                                  children: [
                                    CircleAvatar(backgroundColor: Colors.black, radius: 20,),
                                    IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
