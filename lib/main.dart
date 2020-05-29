import 'package:cactus_app/di/app_module.dart' as di;
import 'package:cactus_app/pages/app/application.dart';
import 'package:flutter/material.dart';

void main() async {
 await di.init();
 runApp(MaterialApp(
  home: Application(),
 ));
}
