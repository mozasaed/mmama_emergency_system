import 'package:flutter/material.dart';
import 'package:mmama/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mama Mtoto App',
      home: splash(),

    );
  }
}



