import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with TickerProviderStateMixin {
  Future<String> getmoreExcuse() async {
    Response response = await Dio().get('http://34.72.142.129/excuse/gen');

    return response.data['excuses'][0].toString();
  }

  Animation ghost;
  AnimationController ghostcontroller;
  @override
  void initState() {
    ghostcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    ghost = Tween(begin: 150.0, end: 170.0).animate(
        CurvedAnimation(curve: Curves.bounceOut, parent: ghostcontroller));
    ghostcontroller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        ghostcontroller.repeat();
      }
      ghostcontroller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: FutureBuilder<String>(
            future: getmoreExcuse(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Scaffold(
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.lightBlue[100],
                            Color.fromRGBO(12, 186, 194, 1)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.blue[900],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "You asked For it...",
                            style: TextStyle(
                                fontFamily: 'Grandstander',
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          child: Hero(
                              tag: 'dash',
                              child: Image.asset('assets/images/boo.png')),
                        ),
                        Container(
                          padding: EdgeInsets.all(30.0),
                          child: Text(snapshot.data,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Grandstander',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900)),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.lightBlue[100],
                            Color.fromRGBO(12, 186, 194, 1)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 200,
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: AnimatedBuilder(
                                animation: ghostcontroller,
                                builder: (context, child) {
                                  return CircleAvatar(
                                    radius: 120,
                                    backgroundColor: Colors.transparent,
                                    child: Hero(
                                        tag: 'dash',
                                        child: Image.asset(
                                            'assets/images/boo.png')),
                                  );
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "HEY!! Stop Staring. It takes time to brew good excuses...",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'GrandStander',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
