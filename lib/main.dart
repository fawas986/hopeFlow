import 'package:flutter/material.dart';
import 'package:hopeflow/login/splash.dart';

import 'package:hopeflow/login/welcomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home:Splash());
  }
}
