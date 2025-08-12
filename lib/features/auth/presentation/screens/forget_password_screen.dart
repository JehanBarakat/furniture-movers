import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/widgets/custom_app_bar.dart';
import 'package:furnituremovers/features/auth/presentation/screens/password_reset_otp_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String selectedCountryCode = '(+963)';
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // حساب responsive values
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 700;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: "نسيت كلمة المرور",
        onTrailingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 40.w : 24.w,
                      vertical: isSmallScreen ? 10.h : 20.h,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - 100.h,
                        maxWidth: isTablet ? 500.w : double.infinity,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: isSmallScreen ? 10.h : 20.h),

                          // الصورة
                          Center(
                            child: Image.asset(
                              'assets/images/forgetpassowrd.png',
                              width: isTablet
                                  ? 300.w
                                  : (isSmallScreen ? 220.w : 260.w),
                              height: isTablet
                                  ? 220.h
                                  : (isSmallScreen ? 140.h : 180.h),
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 20.h : 40.h),

                          // عنوان الحقل
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'رقم التلفون',
                              style: AppTextStyles.heading2Ar.copyWith(
                                fontSize: isTablet
                                    ? 20.sp
                                    : (isSmallScreen ? 14.sp : 16.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 8.h : 12.h),

                          // حقل رقم الهاتف
                          IntlPhoneField(
                            controller: phoneController,
                            initialCountryCode: 'EG',
                            decoration: InputDecoration(
                              hintText: 'أدخل رقم الهاتف',
                              hintTextDirection: TextDirection.rtl,
                              filled: true,
                              fillColor: AppColors.white,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: isTablet
                                    ? 20.h
                                    : (isSmallScreen ? 14.h : 18.h),
                                horizontal: isTablet ? 20.w : 16.w,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: AppColors.grey.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: AppColors.grey.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: AppColors.linearBlue,
                                  width: 2,
                                ),
                              ),
                              counterText: '',
                            ),
                            style: AppTextStyles.heading2Ar.copyWith(
                              fontSize: isTablet
                                  ? 18.sp
                                  : (isSmallScreen ? 14.sp : 16.sp),
                            ),
                            dropdownIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.grey,
                              size: isTablet ? 28.sp : 24.sp,
                            ),
                            dropdownIconPosition: IconPosition.trailing,
                            dropdownTextStyle: TextStyle(
                              color: AppColors.linearBlue,
                              fontSize: isTablet
                                  ? 16.sp
                                  : (isSmallScreen ? 12.sp : 14.sp),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo',
                            ),
                            flagsButtonPadding: EdgeInsets.only(
                              left: isTablet ? 15.w : 10.w,
                            ),
                            showDropdownIcon: true,
                            showCountryFlag: true,
                            textAlign: TextAlign.left,
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                            onCountryChanged: (country) {
                              setState(() {
                                selectedCountryCode = '+${country.dialCode}';
                              });
                            },
                          ),
                          SizedBox(height: isSmallScreen ? 20.h : 40.h),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 40.w : 24.w,
                    vertical: isSmallScreen ? 20.h : 30.h,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PasswordResetOtpScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: isTablet ? 55.h : (isSmallScreen ? 45.h : 50.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff4999CB), Color(0xff4B75CB)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "التالي",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet
                              ? 20.sp
                              : (isSmallScreen ? 16.sp : 18.sp),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Almarai',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
