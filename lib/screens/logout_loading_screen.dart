import 'package:flutter/material.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';

class LogoutLoadingScreen extends StatelessWidget {
  const LogoutLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 16),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGrey),
              strokeWidth: 3,
            ),
            SizedBox(height: 32),
            Text(
              'تسجيل الخروج',
              style: TextStyle(
                fontFamily: 'Almarai',
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 