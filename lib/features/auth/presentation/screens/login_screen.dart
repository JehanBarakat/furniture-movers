import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_spacing.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/widgets/custom_phone_field.dart';
import 'package:furnituremovers/core/widgets/custom_text_field.dart';
import 'package:furnituremovers/core/widgets/primary_button.dart';
import 'package:furnituremovers/features/auth/presentation/screens/register_screen.dart';
import 'package:furnituremovers/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:furnituremovers/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final TextEditingController passwordController = TextEditingController();
  late TapGestureRecognizer _registerTapRecognizer;

  @override
  void initState() {
    super.initState();
    _registerTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      };
  }

  @override
  void dispose() {
    _registerTapRecognizer.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: true, // إضافة هذا السطر
        body: Stack(
          children: [
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    // إضافة SingleChildScrollView
                    child: Padding(
                      padding: AppSpacing.screenPadding,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          // إزالة IntrinsicHeight
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // الترحيب
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 30.h), // تقليل المسافة
                                Text(
                                  "مرحباً بعودتك مجددًا...",
                                  style: AppTextStyles.heading1Ar,
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  "فضلاً قم بتسجيل الدخول إلى حسابك",
                                  style: AppTextStyles.bodyTextAr.copyWith(
                                    color: AppColors.grey,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),

                            SizedBox(height: 16.h),

                            // الصورة
                            Container(
                              // تغيير من Expanded إلى Container
                              height:
                                  MediaQuery.of(context).size.height *
                                  0.25, // تحديد ارتفاع ثابت
                              child: Center(
                                child: Image.asset(
                                  "assets/images/login-image.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h),

                            // الحقول
                            Column(
                              // تغيير من Expanded إلى Column عادي
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "رقم التلفون",
                                  style: AppTextStyles.buttonTextAr.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSpacing.mediumVerticalSpacing.h,
                                ),
                                CustomPhoneInput(onChanged: (fullNumber) {}),

                                SizedBox(height: 16.h),

                                Text(
                                  "كلمة المرور",
                                  style: AppTextStyles.buttonTextAr.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSpacing.mediumVerticalSpacing.h,
                                ),
                                CustomTextField(
                                  textDirection: TextDirection.rtl,
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

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    onPressed: () {
                                      // الانتقال لصفحة نسيت كلمة المرور
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgetPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "نسيت كلمة المرور؟",
                                      style: AppTextStyles.smallTextAr,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20.h), // إضافة مسافة ثابتة

                                PrimaryButton(
                                  text: "تسجيل الدخول",
                                  padding: const EdgeInsets.all(5),
                                  textStyle: AppTextStyles.bodyTextAr.copyWith(
                                    color: AppColors.white,
                                  ),
                                  onTap: _login,
                                  width: double.infinity,
                                ),
                              ],
                            ),

                            // رابط إنشاء حساب
                            Column(
                              children: [
                                SizedBox(height: 12.h),
                                Text.rich(
                                  TextSpan(
                                    text: "ليس لديك حساب؟ ",
                                    style: AppTextStyles.smallTextAr,
                                    children: [
                                      TextSpan(
                                        text: "إنشاء جديد",
                                        style: AppTextStyles.smallTextAr
                                            .copyWith(
                                              color: AppColors.primaryBlue,
                                            ),
                                        recognizer: _registerTapRecognizer,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.h),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // مؤشر التحميل
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
                        "جاري تسجيل الدخول...",
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
