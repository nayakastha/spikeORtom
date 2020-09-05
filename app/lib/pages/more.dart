import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(child: Text("Hello")),
      ),
    );
  }
}
