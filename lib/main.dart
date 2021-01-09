import 'dart:ui';
import 'package:flutter/material.dart';
import 'screen/Loginscreen.dart';
import 'screen/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: LoginScreen(),
    );
  }
}



