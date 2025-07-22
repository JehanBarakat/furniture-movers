import 'package:flutter/material.dart';
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
        trailingIcon: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: Colors.black,
        ),
        onTrailingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/forgetpassowrd.png',
                  width: 380,
                  height: 283,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 48),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('رقم التلفون', style: AppTextStyles.heading2Ar),
                ),
              ),
              const SizedBox(height: 16),
              IntlPhoneField(
                controller: phoneController,
                initialCountryCode: 'EG',
                decoration: InputDecoration(
                  hintText: 'أدخل رقم الهاتف',
                  hintTextDirection: TextDirection.rtl,
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),

                // ✅ التحكم بشكل خط الرقم الذي يُدخله المستخدم
                style: AppTextStyles.heading2Ar,

                dropdownIcon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.grey,
                ),
                dropdownIconPosition: IconPosition.trailing,

                // ✅ التحكم بخط رمز الدولة
                dropdownTextStyle: const TextStyle(
                  color: AppColors.linearBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo', // 👈 نفس الخط للتماشي
                ),

                flagsButtonPadding: const EdgeInsets.only(left: 8),
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

              SizedBox(height: 232),
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
