import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;//لإخفاء النص
  final Widget? prefixIcon;//أيقونة بداية الحقل
  final Widget? suffixIcon;// أيقونة نهاية الحقل
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;//للتحقق من المدخلات
  final double? width;
  final double? height;
  final Function(String)? onChanged; // أضفت هذا السطر


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
    this.height = 48,
    this.onChanged, // أضفت هذا السطر
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure;//للتحكم اذا لازم بخفي النص او لا

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;//أول ما ينشئ الحقل، ياخذ القيمة الأولى من obscureText
  }

  void _toggleVisibility() {
    setState(() {
      _obscure = !_obscure;//لإظهر او إخفاء النص عند الضغلط على الأيقونة
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isCommentField = widget.height == 107;//اذا الحقل ارتفاعه 107 فهو حقل للتعليق => بكون  multi-line
    final Widget? suffixIcon = widget.obscureText//اذا obscureText=true يستخدم أيقونة العين
        ? IconButton(
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
              color: AppColors.mediumGrey,
            ),
            onPressed: _toggleVisibility,
          )
        : widget.suffixIcon;// و إلا الأيقونة المحددة 


     // تحديد اتجاه النص بناءً على اللغة
  TextDirection textDirection =
      Localizations.localeOf(context).languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscure,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        maxLines:isCommentField ? 5 : 1, //إذا حقل تعليق أقصى عدد للأسطر هو 5 و الا  سطر 
        minLines: isCommentField ? 3 : 1,//إذا حقل تعليق أدنى عدد للأسطر هو 3 و الا  سطر 
        style: const TextStyle(fontSize: 16, color: Colors.black),
        textDirection: textDirection,
        onChanged: widget.onChanged, // أضفت هذا السطر
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          filled: true,
          fillColor:AppColors.veryLightGrey,
          prefixIcon: widget.prefixIcon,
          suffixIcon: suffixIcon, 
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.veryLightGrey),
          ),
          //الحدود اذا كان الحقل مفعّل 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color:AppColors.veryLightGrey),
          ),
          // الحدود عند التركيز على الحقل
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primaryBlue),
          ),
        ),
      ),
    );
  }
}
