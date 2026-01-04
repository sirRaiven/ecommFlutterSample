import 'package:flutter/material.dart';
import 'package:practices101/pages/Login.dart';

void main() {
  runApp(practices101());
} 

class practices101 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login()
    );
  }
} 