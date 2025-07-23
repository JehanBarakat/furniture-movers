import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class SplashScreenCustom extends StatelessWidget {
  const SplashScreenCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoSize = size.width * 0.32; // حجم الشعار كنسبة من العرض
    final verticalSpace = size.height * 0.04; // مسافة رأسية كنسبة من الارتفاع
    final logoHeight = size.height * 0.5;
    final logoWidth = logoHeight; // اجعل العرض مساوي للارتفاع ليبقى الشعار مربعاً
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // خلفية نقاط خفيفة
          CustomPaint(
            size: size,
            painter: DotGridPainter(),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png.png',
                  width: logoWidth,
                  height: logoHeight,
                ),
                SizedBox(height: verticalSpace.clamp(16, 48)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Text(
                    'خدماتك',
                    style: AppTextStyles.heading1Ar.copyWith(fontSize: (size.width * 0.08).clamp(22, 36)),
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