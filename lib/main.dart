import 'package:flutter/material.dart';

import 'View/Dashboard/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TECHNICAL ASSESSMENT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const BottomBar(),
    );
  }
}


