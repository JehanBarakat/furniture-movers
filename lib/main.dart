import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // ← استيراد الصفحة

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture Movers',
      home: const HomeScreen(), // ← هون حددنا أول صفحة تظهر
    );
  }
}
