import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/utils/dialog_utils.dart';
import 'package:furnituremovers/core/widgets/custom_app_bar.dart';
import 'package:furnituremovers/core/widgets/custom_text_field.dart';
import 'package:furnituremovers/core/widgets/primary_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (newPasswordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('كلمة المرور غير متطابقة')),
        );
        return;
      }

      DialogUtils.showCustomDialog(
        context: context,
        title: "تمت إعادة تعيين كلمة المرور",
        confirmButtonText: "موافق",
        customIcon: ClipOval(
          child: Image.asset(
            "assets/images/Group 1000002228.png",
            width: 120.w,
            height: 120.w,
            fit: BoxFit.cover,
          ),
        ),
        onConfirm: () {
          Navigator.pop(context); // إغلاق مربع الحوار
          Navigator.pop(context); // العودة للخلف
        },
      );
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "إعادة تعيين كلمة المرور",
        trailingIcon: Icon(
          Icons.arrow_forward_ios,
          size: 20.sp,
          color: AppColors.black,
        ),
        onTrailingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Reset password-cuate 1.png',
                  width: 320.w,
                  height: 320.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'كلمة المرور الجديدة',
                    style: AppTextStyles.heading2Ar.copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              CustomTextField(
                hintText: 'كلمة المرور الجديدة',
                controller: newPasswordController,
                obscureText: _obscureNewPassword,
                textDirection: TextDirection.rtl,
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: _toggleNewPasswordVisibility,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال كلمة المرور الجديدة';
                  }
                  if (value.length < 8) {
                    return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'تأكيد كلمة المرور',
                    style: AppTextStyles.heading2Ar.copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              CustomTextField(
                hintText: 'تأكيد كلمة المرور',
                controller: confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                textDirection: TextDirection.rtl,
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: _toggleConfirmPasswordVisibility,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء تأكيد كلمة المرور';
                  }
                  if (value.length < 8) {
                    return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
                  }
                  return null;
                },
              ),
              SizedBox(height: 120.h),
              PrimaryButton(
                text: "تأكيد",
                textStyle: AppTextStyles.buttonTextAr.copyWith(fontSize: 16.sp),
                onTap: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
