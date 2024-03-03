import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffccebc9),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
