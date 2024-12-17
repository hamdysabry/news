import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/pages/register/register_screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  static const String routeName = "splash";

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
