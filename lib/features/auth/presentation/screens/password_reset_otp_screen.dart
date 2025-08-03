import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/widgets/custom_app_bar.dart';
import 'package:furnituremovers/core/widgets/primary_button.dart';
import 'package:furnituremovers/features/auth/presentation/screens/otp.dart';
import 'package:furnituremovers/features/auth/presentation/screens/reset_password_screen.dart';

class PasswordResetOtpScreen extends StatefulWidget {
  const PasswordResetOtpScreen({super.key});

  @override
  State<PasswordResetOtpScreen> createState() => _PasswordResetOtpScreenState();
}

class _PasswordResetOtpScreenState extends State<PasswordResetOtpScreen> {
  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'التحقق من الكود',
        trailingIcon: Icon(
          Icons.arrow_forward_ios,
          size: 16.sp, // ← Responsive
          color: Colors.black,
        ),
        onTrailingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w), // ← Responsive
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'لقد ارسلنا رمز التحقق إلى +963930821058',
              style: AppTextStyles.heading2Ar,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h), // ← Responsive

            Center(
              child: Image.asset(
                'assets/images/OTP security image.png',
                width: 282.w, // ← Responsive
                height: 254.h, // ← Responsive
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30.h), // ← Responsive

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'كود التحقق',
                style: AppTextStyles.heading2Ar,
              ),
            ),
            SizedBox(height: 8.h), // ← Responsive

            CustomOtpField(
              length: 6,
              onCompleted: (code) {
                setState(() {
                  otpCode = code;
                });
                //print('OTP Entered: $code');
              },
            ),
            SizedBox(height: 40.h), // ← Responsive

            Text(
              "لم تتلق الرمز؟",
              style: AppTextStyles.smallTextAr,
            ),
            TextButton(
              onPressed: () {
                print('إعادة إرسال الكود');
              },
              child: Text(
                'أعد إرسال الرمز؟',
                style: TextStyle(
                  color: const Color(0xff4B75CB),
                  fontSize: 14.sp, // ← Responsive
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 120.h), // ← Responsive

            PrimaryButton(
              text: "التالي",
              textStyle: AppTextStyles.buttonTextAr,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
