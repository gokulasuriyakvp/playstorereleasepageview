import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playstore_pageview/page_viewtext.dart';



class SplashScareen extends StatefulWidget {
  const SplashScareen({Key? key}) : super(key: key);

  @override
  State<SplashScareen> createState() => _SplashScareenState();
}

class _SplashScareenState extends State<SplashScareen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => PageViewText()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'images/backgroundimage.jpg',
            ),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'images/authorimage.jpg',
                  width: 160,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(padding: EdgeInsets.all(20),
             child: Text(
                'Its a dear, good world, and I love it.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
