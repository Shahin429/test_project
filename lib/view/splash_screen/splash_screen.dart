import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_project/view/home_view/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print(" Here I'm A time : $Timer");
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/image/logo.png",
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        fit: BoxFit.cover,
      ),
    );
  }
}
