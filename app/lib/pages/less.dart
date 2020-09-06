import 'package:app/pages/more.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> getExcuse() async {
    Response response = await Dio().get('http://35.208.101.72/getx/');

    return response.data['MESSAGE'].toString();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<String>(
          future: getExcuse(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return new Scaffold(
                body: Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(colors: [
                      Colors.lightBlue[100],
                      Color.fromRGBO(12, 186, 194, 1)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "BunkIt",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'Grandstander',
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.6,
                        child: Hero(
                            tag: 'dash',
                            child: Image.asset('assets/images/boo.png')),
                      ),
                      new Container(
                        //height: 170,
                        padding: EdgeInsets.only(
                            left: 34.0, right: 24.0, bottom: 20.0, top: 20.0),
                        child: Text(
                          snapshot.data,
                          style: TextStyle(
                            fontFamily: 'Grandstander',
                            fontSize: 30,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            child: new FloatingActionButton.extended(
                                heroTag: "btn1",
                                onPressed: () {
                                  setState(() {
                                    getExcuse();
                                  });
                                },
                                label: Text(
                                  "GENERATE EXCUSE",
                                  style: TextStyle(
                                      fontFamily: 'Grandstander',
                                      fontWeight: FontWeight.w900),
                                )),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            child: new FloatingActionButton.extended(
                              heroTag: "btn2",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewPage()),
                                );
                              },
                              label: Text(
                                "More Trouble? We got your back !",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Grandstander',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(colors: [
                      Colors.lightBlue[100],
                      Color.fromRGBO(12, 186, 194, 1)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Center(child: new CircularProgressIndicator()));
            } // unreachable
          },
        ),
      ),
    );
  }
}
