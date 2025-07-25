import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/widgets/custom_app_bar.dart';
import 'package:furnituremovers/core/widgets/primary_button.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
        title: "نسيت كلمة المرور",
        trailingIcon: Icon(
          Icons.arrow_forward_ios,
          size: 20.sp,
          color: Colors.black,
        ),
        onTrailingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/forgetpassowrd.png',
                  width: 380.w,
                  height: 283.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 48.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('رقم التلفون', style: AppTextStyles.heading2Ar),
                ),
              ),
              SizedBox(height: 16.h),

              IntlPhoneField(
                controller: phoneController,
                initialCountryCode: 'EG',
                decoration: InputDecoration(
                  hintText: 'أدخل رقم الهاتف',
                  hintTextDirection: TextDirection.rtl,
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 12.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  counterText: '', // <=== هنا إزالة العداد
                ),

                style: AppTextStyles.heading2Ar,

                dropdownIcon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.grey,
                ),
                dropdownIconPosition: IconPosition.trailing,

                dropdownTextStyle: TextStyle(
                  color: AppColors.linearBlue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),

                flagsButtonPadding: EdgeInsets.only(left: 8.w),
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

              SizedBox(height: 232.h),

              PrimaryButton(
                text: "التالي",
                textStyle: AppTextStyles.buttonTextAr,
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
      ),
    );
  }
}
