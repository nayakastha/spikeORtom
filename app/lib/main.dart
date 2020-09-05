import 'package:flutter/material.dart';
import 'pages/less.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromRGBO(48, 51, 104, 1),
          accentColor: Color.fromRGBO(252, 168, 47, 1)),
    );
  }
}
