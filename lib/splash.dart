import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hopeflow/home.dart';
import 'package:hopeflow/welcomepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
        return Welcome_page();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050622),
      body: Center(
        child: Image(
          image: AssetImage("assets/images/logo.png"),
          alignment: Alignment.center,
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
