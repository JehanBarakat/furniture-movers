import 'package:flutter/material.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/widgets/custom_app_bar.dart';
import 'package:furnituremovers/core/widgets/primary_button.dart';
import 'package:furnituremovers/features/auth/presentation/screens/otp.dart';

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
        trailingIcon: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black,
        ),
        onTrailingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // النص العلوي
            Text(
              'لقد ارسلنا رمز التحقق إلى +963930821058',
              style: AppTextStyles.heading2Ar,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // الصورة
            Center(
              child: Image.asset(
                'assets/images/OTP security image.png',
                width: 282,
                height: 254,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),

            // عنوان كود التحقق (محاذاة لليمين)
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'كود التحقق',
                style: AppTextStyles.heading2Ar
              ),
            ),
            const SizedBox(height: 8),

            // مربعات OTP
            CustomOtpField(
              length: 6,
              onCompleted: (code) {
                setState(() {
                  otpCode = code;
                });
                print('OTP Entered: $code');
              },
            ),
            const SizedBox(height: 40),
            Text("لم تتلق الرمز؟",style: AppTextStyles.smallTextAr,),
//SizedBox(height: 6,),
            
            TextButton(
              onPressed: () {
                print('إعادة إرسال الكود');
              },
              child: const Text(
                'أعد إرسال الرمز؟',
                style: TextStyle(
                  color: Color(0xff4B75CB),
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
            SizedBox(height: 120,),
            PrimaryButton(
  text: "التالي",textStyle: AppTextStyles.buttonTextAr,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordResetOtpScreen(),
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