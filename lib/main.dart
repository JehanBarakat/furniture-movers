import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Font Example',
      theme: ThemeData(
        fontFamily: 'Almarai', // اسم الخط اللي عرفته في pubspec.yaml
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('مثال على خط Almarai'),
        ),
        body: const Center(
          child: Text(
            'مرحبا بخط المراعي 😊',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold, // يستخدم Almarai-Bold تلقائياً
            ),
          ),
        ),
      ),
    );
  }
}