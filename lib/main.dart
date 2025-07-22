import 'package:flutter/material.dart';
import 'package:furnituremovers/features/auth/presentation/screens/forget_password_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture Movers',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // ✅ يجعل خلفية كل الشاشات بيضاء
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: const ForgetPasswordScreen(), // ✅ عرض الشاشة الرئيسية
    );
  }
}
