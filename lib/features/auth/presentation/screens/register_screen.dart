import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_spacing.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/widgets/custom_phone_field.dart';
import 'package:furnituremovers/core/widgets/custom_text_field.dart';
import 'package:furnituremovers/core/widgets/primary_button.dart';
import 'package:furnituremovers/features/auth/presentation/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  void _register() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('تم إنشاء الحساب بنجاح')));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: AppSpacing.mediumVerticalSpacing.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'إنشاء حساب',
                        style: AppTextStyles.heading1Ar,
                      ),
                    ),
                    SizedBox(height: AppSpacing.smallVerticalSpacing.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          style: AppTextStyles.bodyTextAr.copyWith(
                            color: AppColors.grey,
                          ),
                          children: [
                            const TextSpan(text: 'مرحباً بك في '),
                            TextSpan(
                              text: 'خدماتك',
                              style: AppTextStyles.bodyTextAr.copyWith(
                                color: AppColors.primaryBlue,
                              ),
                            ),
                            const TextSpan(text: '، قم بإنشاء حساب معنا.'),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: AppSpacing.largeVerticalSpacing.h),

                    _buildLabeledField(
                      "الاسم",
                      CustomTextField(
                        textDirection: TextDirection.rtl,
                        hintText: 'الاسم الكامل',
                        controller: nameController,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/personline.svg',
                          width: 14,
                          height: 14,
                          colorFilter: ColorFilter.mode(
                            AppColors.mediumPrimary,
                            BlendMode.srcIn,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'الرجاء إدخال الاسم الكامل';
                          }
                          if (value.trim().length < 3) {
                            return 'الاسم يجب أن يكون على الأقل 3 أحرف';
                          }
                          return null;
                        },
                      ),
                    ),

                    SizedBox(height: AppSpacing.mediumVerticalSpacing.h),

                    _buildLabeledField(
                      "رقم التلفون",
                      CustomPhoneInput(onChanged: (fullNumber) {}),
                    ),

                    SizedBox(height: AppSpacing.mediumVerticalSpacing.h),

                    _buildLabeledField(
                      "كلمة المرور",
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
                    ),

                    SizedBox(height: AppSpacing.mediumVerticalSpacing.h),

                    _buildLabeledField(
                      "تأكيد كلمة المرور",
                      CustomTextField(
                        textDirection: TextDirection.rtl,
                        hintText: '*****************',
                        controller: confirmPasswordController,
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
                            return 'الرجاء تأكيد كلمة المرور';
                          }
                          if (value != passwordController.text) {
                            return 'كلمة المرور غير متطابقة';
                          }
                          if (value.trim().length < 8) {
                            return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
                          }
                          return null;
                        },
                      ),
                    ),

                    SizedBox(height: AppSpacing.largeVerticalSpacing.h * 2),
                    PrimaryButton(
                      text: "إنشاء جديد",
                      padding: const EdgeInsets.all(5),
                      textStyle: AppTextStyles.bodyTextAr.copyWith(
                        color: AppColors.white,
                      ),
                      onTap: _register,
                      width: double.infinity,
                    ),

                    SizedBox(height: AppSpacing.largeVerticalSpacing.h),

                    RichText(
                      text: TextSpan(
                        text: "لديك حساب مسبقاً؟ ",
                        style: AppTextStyles.smallTextAr,
                        children: [
                          TextSpan(
                            text: "تسجيل الدخول",
                            style: AppTextStyles.smallTextAr.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),

              if (_isLoading)
                Container(
                  color: AppColors.white.withOpacity(0.8),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// ويدجت لتجميع النص والعنصر تحت بعض
  Widget _buildLabeledField(String label, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: AppTextStyles.buttonTextAr.copyWith(color: AppColors.black),
          ),
        ),
        SizedBox(height: AppSpacing.mediumVerticalSpacing.h),
        child,
      ],
    );
  }
}
