import 'dart:async';

import 'package:cactus_app/pages/home/home_page.dart';
import 'package:cactus_app/values/images.dart';
import 'package:cactus_app/values/strings.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashPageWidget();
}

class SplashPageWidget extends State<SplashPage> {
  static const int TIME_DELAY = 2500;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: TIME_DELAY), () {
      Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (_) => new HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: <Widget>[
          Container(
            color: Colors.deepOrange,
            child: Center(
              child: Container(
                child: Image.asset(ImageUtils.splashScreenBg),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 50),
            child: Text(
              StringUtils.splashTitleApp,
              style: TextStyle(
                  decoration: TextDecoration.none, fontSize: 30, color: Colors.white, fontStyle: FontStyle.normal),
            ),
          )
        ],
      ),
    );
  }
}
