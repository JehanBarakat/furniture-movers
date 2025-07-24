import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // لاستخدام ScreenUtil
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_spacing.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/widgets/custom_phone_field.dart';
import 'package:furnituremovers/core/widgets/custom_text_field.dart';
import 'package:furnituremovers/core/widgets/primary_button.dart';
import 'package:furnituremovers/features/auth/presentation/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  final TextEditingController passwordController = TextEditingController();

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // منطق تسجيل الدخول بعد النجاح
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:AppColors.white ,
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 60.h), 
                   Align(
  alignment: Alignment.centerRight,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.end, // يخلي النصوص كلها عاليمين
    children: [
      Text(
        "مرحباً بعودتك مجددًا...",
        style: AppTextStyles.heading1Ar,
        textAlign: TextAlign.right,
      ),
      SizedBox(height: 8.h),
      Text(
        "فضلاً قم بتسجيل الدخول إلى حسابك  ",
        style: AppTextStyles.bodyTextAr.copyWith(color: AppColors.grey),
        textAlign: TextAlign.right,
      ),
    ],
  ),
),



                    SizedBox(height: 40.h),
                    Image.asset(
                      "assets/images/login-image.png",
                      height: 279.h,
                      width: 214.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "رقم التلفون",
                        style: AppTextStyles.buttonTextAr.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.mediumVerticalSpacing.h),
                    CustomPhoneInput(onChanged: (fullNumber) {}),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "كلمة المرور",
                        style: AppTextStyles.buttonTextAr.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.mediumVerticalSpacing.h),
                    CustomTextField(
                      hintText: '*****************',
                      controller: passwordController,
                      obscureText: true,
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/lock-open.svg',
                        width: 14,
                        height: 19,
                        colorFilter: ColorFilter.mode(
                          AppColors.mediumPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'الرجاء إدخال كلمة المرور';
                        }
                        if (value.trim().length < 8) {
                          return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.smallVerticalSpacing.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // الانتقال لصفحة نسيان كلمة المرور
                        },
                        child: Text(
                          "نسيت كلمة المرور؟",
                          style: AppTextStyles.smallTextAr,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.largeVerticalSpacing.h),
                    PrimaryButton(
                      text: "تسجيل الدخول",
                      textStyle:AppTextStyles.bodyTextAr .copyWith(color: AppColors.white),
                      onTap: _login,
                      width: 380.h,
                    ),
                    SizedBox(height: AppSpacing.mediumVerticalSpacing.h),
                    RichText(
                      text: TextSpan(
                        text: "ليس لديك حساب؟ ",
                        style: AppTextStyles.smallTextAr,
                        children: [
                          TextSpan(
                            text: "إنشاء جديد",
                            style: AppTextStyles.smallTextAr.copyWith(
                              color: AppColors.primaryBlue,
                              
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (_isLoading)
              Container(
                color: AppColors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      SizedBox(height: AppSpacing.mediumVerticalSpacing.h),
                      Text(
                        "تسجيل الدخول",
                        style: AppTextStyles.heading1Ar,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
