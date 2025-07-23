import 'package:flutter/material.dart';
import 'package:furnituremovers/core/widgets/custom_phone_field.dart';
import 'package:furnituremovers/core/widgets/custom_text_field.dart';
import 'package:furnituremovers/core/widgets/otp_input_field.dart';
import 'features/settings/presentation/screens/about app.dart';
import 'features/settings/presentation/screens/app-language.dart';
import 'features/settings/presentation/screens/app-model.dart';
import 'features/settings/presentation/screens/concat-us.dart';
import 'features/settings/presentation/screens/term&condditions.dart';

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
      home: TermsAndConditionsScreen(),
    ); 
  }
}


