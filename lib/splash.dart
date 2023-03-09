import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mmama/home.dart';

import 'Contacts.dart';

class splash extends StatefulWidget{
  @override
  _splashState  createState() => _splashState();

}

class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    });
  }


  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}