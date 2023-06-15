
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_setup/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool alreadyUsed = false;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  @override
  void initState() {
    super.initState();

    getData();
    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context) {
      return HomeScreen();
    },)) );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Stack(
          children: [
            Text('Splash screen')
          ],
        ),
      )
    );
  }
}