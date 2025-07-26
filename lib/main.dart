// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/widgets/custom_bottom_nav_bar.dart';
import 'package:furnituremovers/features/auth/presentation/screens/login_screen.dart';
import 'package:furnituremovers/screens/chat.dart';
import 'package:furnituremovers/screens/favorite_page.dart';

import 'package:furnituremovers/screens/home_screen.dart';
import 'package:furnituremovers/screens/onboarding/splash_screen.dart';
import 'package:furnituremovers/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Furniture Movers',
          theme: ThemeData(
            fontFamily: 'Almarai',
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const SplashScreenCustom(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(), // index 0
    ChatPage(), // index 1
    FavoritePage(), // index 2
    ProfileScreen(), // index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
