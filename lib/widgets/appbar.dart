import 'package:cactus_app/values/images.dart';
import 'package:cactus_app/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarCactus {
  static cactusAppBar(IconData iconAction, VoidCallback callback) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(ImageUtils.splashScreenBg, fit: BoxFit.cover, height: 35),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              StringUtils.splashTitleApp,
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                  fontStyle: FontStyle.normal),
            ),
          )
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
            color: Colors.grey,
            iconSize: 25,
            icon: Icon(iconAction),
            onPressed: callback,
          ),
        )
      ],
    );
  }
}
