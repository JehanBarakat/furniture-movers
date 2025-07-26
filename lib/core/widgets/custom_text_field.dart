import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';

import '../constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText; // لإخفاء النص
  final Widget? prefixIcon; // أيقونة بداية الحقل
  final Widget? suffixIcon; // أيقونة نهاية الحقل
  final TextInputType? keyboardType;
  final String? Function(String?)? validator; // للتحقق من المدخلات
  final double? width;
  final double? height;


  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.width = 380,
    this.height = 48, required TextDirection textDirection,

  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  late bool _obscure; // للتحكم إذا لازم نخفي النص أو لا


  @override
  void initState() {
    super.initState();

    _obscure = widget.obscureText; // أول ما ينشأ الحقل، ياخذ القيمة الأولى

  }

  void _toggleVisibility() {
    setState(() {

      _obscure = !_obscure; // إظهار أو إخفاء النص عند الضغط على الأيقونة

    });
  }

  @override
  Widget build(BuildContext context) {

    final bool isCommentField = widget.height == 107; // إذا الحقل تعليق
    final Widget? suffixIcon = widget.obscureText

        ? IconButton(
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
              color: AppColors.mediumGrey,

              size: 18,
            ),
            onPressed: _toggleVisibility,
          )
        : widget.suffixIcon;

    // تحديد اتجاه النص بناءً على اللغة
    TextDirection textDirection =
        Localizations.localeOf(context).languageCode == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr;

    return SizedBox(
      width: widget.width!.w,
      height: widget.height!.h,

      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscure,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        maxLines: isCommentField ? 5 : 1,
        minLines: isCommentField ? 3 : 1,
        style: TextStyle(fontSize: 14.sp, color: AppColors.black),
        textDirection: textDirection,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyles.smallTextAr.copyWith(fontSize: 12),
          filled: true,
          fillColor: AppColors.veryLightGrey,
          prefixIcon: widget.prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.veryLightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.veryLightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),

            borderSide: BorderSide(color: AppColors.primaryBlue),
          ),
        ),
      ),
    );
  }
}
