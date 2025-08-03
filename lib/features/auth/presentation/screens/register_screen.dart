import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? phoneNumber; // يبقى ظاهرياً في الواجهة لكن لن يُرسل

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  static const String _anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw';
  static const String _baseUrl = 'https://ftcbwmmsnykncncsyrfs.supabase.co';

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final email = emailController.text.trim();
    final password = passwordController.text;

    final url = Uri.parse('$_baseUrl/auth/v1/signup');

    final headers = {
      'Content-Type': 'application/json',
      'apikey': _anonKey,
    };

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'تم إنشاء الحساب بنجاح. يرجى التحقق من بريدك لتأكيد الحساب.')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      } else {
        final respBody =
            response.body.isNotEmpty ? jsonDecode(response.body) : {};
        String message = 'فشل إنشاء الحساب.';

        if (respBody is Map) {
          if (respBody['error_description'] != null) {
            message = respBody['error_description'];
          } else if (respBody['message'] != null) {
            message = respBody['message'];
          } else if (respBody['error'] != null) {
            message = respBody['error'];
          }
        }

        print('API Error Response: ${response.body}');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } catch (e) {
      print('Exception caught: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
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
                child: Form(
                  key: _formKey,
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
                              const TextSpan(
                                  text: '، قم بإنشاء حساب معنا.'),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: AppSpacing.largeVerticalSpacing.h),

                      _buildLabeledField(
                        "البريد الإلكتروني",
                        CustomTextField(
                          textDirection: TextDirection.rtl,
                          hintText: 'example@domain.com',
                          controller: emailController,
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/mail.svg',
                            width: 14,
                            height: 14,
                            colorFilter: ColorFilter.mode(
                              AppColors.mediumPrimary,
                              BlendMode.srcIn,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'الرجاء إدخال البريد الإلكتروني';
                            }
                            return null; // بدون تحقق بصيغة محددة
                          },
                        ),
                      ),

                      SizedBox(height: AppSpacing.mediumVerticalSpacing.h),

                      _buildLabeledField(
                        "رقم التلفون",
                        CustomPhoneInput(
                          onChanged: (fullNumber) {
                            phoneNumber = fullNumber; // احتفظ به فقط من منظور واجهة
                          },
                        ),
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
