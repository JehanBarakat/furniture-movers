import 'dart:async';
import 'package:flutter/material.dart';

import 'package:furnituremovers/features/auth/presentation/screens/login_screen.dart';
import 'package:furnituremovers/screens/onboarding/onboarding_screen.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class SplashScreenCustom extends StatefulWidget {
  const SplashScreenCustom({Key? key}) : super(key: key);

  @override
  State<SplashScreenCustom> createState() => _SplashScreenCustomState();
}

class _SplashScreenCustomState extends State<SplashScreenCustom> {
  @override
  void initState() {
    super.initState();
    // بعد ثانيتين ننتقل لصفحة تسجيل الدخول
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingFlowScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoHeight = size.height * 0.5;
    final logoWidth = logoHeight;
    final verticalSpace = size.height * 0.04;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          CustomPaint(size: size, painter: DotGridPainter()),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/Clip.png',
                  width: logoWidth,
                  height: logoHeight,
                ),
                SizedBox(height: verticalSpace.clamp(16, 48)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Text(
                    'خدماتك',
                    style: AppTextStyles.heading1Ar.copyWith(
                      fontSize: (size.width * 0.08).clamp(22, 36),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.08)
      ..style = PaintingStyle.fill;
    const double spacing = 24;
    const double radius = 1.5;
    for (double y = spacing / 2; y < size.height; y += spacing) {
      for (double x = spacing / 2; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
