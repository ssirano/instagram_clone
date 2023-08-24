import 'package:flutter/material.dart';
import 'dart:async';
import 'main_feed_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
  }

  class _SplashScreenState extends State<SplashScreen>{
  @override
    void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainFeedScreen()),
      );
    });
  }
  @override
    Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/instagram_log.jpg', width: 100, height: 100,),
            SizedBox(height: 20),
            Text('Instagram Clone', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
          ],
        )
      )
    );
  }


  }
