import 'package:flutter/material.dart';
import 'package:flutter_real_estate_app/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        secondaryHeaderColor: Colors.orange,
        fontFamily: 'Euclid Circular A',
      ),
      home: MainPage(),
    );
  }
}
