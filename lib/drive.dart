import 'package:flutter/material.dart';
import 'package:hackerkernel/profile.dart';

class Drive extends StatefulWidget {
  final Function toggleView;
  Drive({this.toggleView});
  @override
  _DriveState createState() => _DriveState();
}

class _DriveState extends State<Drive> {
  final List<int> joined = <int>[9523, 9785, 1050];
  final List<bool> join = <bool>[true,true,true];
  final List<String> category = <String>['Spiritual Empowerment', 'Spiritual Strategy', 'Spiritual Practice'];
  final List<String> time = <String>['5 AM | 7 SEPT 2021', '5 AM | 8 SEPT 2021', '5 AM | 9 SEPT 2021'];
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
                  height: (MediaQuery.of(context).size.height)*0.25,
                  color: Colors.orange,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: (MediaQuery.of(context).size.height)*0.7,
                child: ListView.builder(
                  itemCount: joined.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmlnaHQlMjBza3l8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                              fit: BoxFit.cover,
                            )
                          ),
                          height: 250,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('${joined[index]}', style: TextStyle(color: Colors.white, fontSize: 20),),
                                      SizedBox(height: 5,),
                                      Text('JOINED', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12),),
                                    ],
                                  ),
                                  SizedBox(width: 20,)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('CATEGORY', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12),),
                                      SizedBox(height: 8,),
                                      Text(category[index].toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20),),
                                      SizedBox(height: 15,),
                                      Row(children: [
                                        Icon(Icons.access_time, color: Colors.white,),
                                        SizedBox(width: 5,),
                                        Text(time[index], style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12),)
                                      ],)
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if(join[index]){
                                              join[index]=false; joined[index]-=1;
                                            }
                                            else{
                                              join[index]=true; joined[index]+=1;
                                            }
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.lightGreen,
                                          ),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                )
                                            )
                                        ),
                                        child: join[index]?Text('JOINED', style: TextStyle(color: Colors.white),):Text('LEFT', style: TextStyle(color: Colors.white),),
                                      ),
                                      flex: 1,
                                    ),
                                    SizedBox(width: 15,),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(
                                              Colors.white,
                                            ),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(18.0),
                                                )
                                            )
                                        ),
                                        child: Text('DO KARMA', style: TextStyle(color: Colors.black),),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
