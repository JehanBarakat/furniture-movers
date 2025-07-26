import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { filled, outlined }

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width; // لو null، يمتد ليملأ المساحة المتاحة
  final double height;
  final EdgeInsetsGeometry padding;
  final LinearGradient gradient;
  final TextStyle? textStyle;
  final BorderRadiusGeometry borderRadius;
  final ButtonType buttonType;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width, // صار اختياري
    this.height = 48,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    this.gradient = const LinearGradient(
      colors: [Color(0xff4999CB), Color(0xff4B75CB)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.buttonType = ButtonType.filled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width != null ? width!.w : double.infinity,
        height: height.h,
        padding: padding,  
        decoration: BoxDecoration(
          color: buttonType == ButtonType.outlined ? Colors.white : null,
          gradient: buttonType == ButtonType.filled ? gradient : null,
          borderRadius: borderRadius,
          border: buttonType == ButtonType.outlined
              ? Border.all(color: gradient.colors.first, width: 1.5.w)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style:
              textStyle ??
              TextStyle(
                color: buttonType == ButtonType.outlined
                    ? gradient.colors.first
                    : Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
