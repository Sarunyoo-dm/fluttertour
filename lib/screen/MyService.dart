import 'package:flutter/material.dart';
import 'package:test_error/screen/SignUp.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_error/main.dart';



// rest of `flutter create` code...

class MyService extends StatefulWidget {
  @override
  _MyService createState() => _MyService();
}



class _MyService extends State<MyService> {
//Method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: Text('Body'),
    );
  }
}



