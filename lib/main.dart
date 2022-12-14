import 'package:flutter/material.dart';
import 'package:getx_practice/controller.dart';
import 'package:get/get.dart';
import 'package:getx_practice/personal_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: PersonalCard(),
    );
  }
}
