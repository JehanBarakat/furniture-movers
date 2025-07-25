
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { filled, outlined }

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final LinearGradient gradient;
  final TextStyle? textStyle;
  final BorderRadiusGeometry borderRadius;
  final ButtonType buttonType;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 385,
    this.height = 48,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
    this.gradient = const LinearGradient(
      colors: [Color(0xff4999CB), Color(0xff4B75CB)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.buttonType = ButtonType.filled, // الافتراضي: ممتلئ
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        padding: EdgeInsets.symmetric(
          horizontal: (padding as EdgeInsets).horizontal / 2.w,
          vertical: (padding as EdgeInsets).vertical / 2.h,
        ),
        decoration: BoxDecoration(
          color: buttonType == ButtonType.outlined ? Colors.white : null,
          gradient: buttonType == ButtonType.filled ? gradient : null,
          borderRadius: BorderRadius.all(
            Radius.circular(
              (borderRadius as BorderRadius).topLeft.x.w,
            ),
          ),
          border: buttonType == ButtonType.outlined
              ? Border.all(color: const Color(0xff4999CB), width: 1.5.w)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: buttonType == ButtonType.outlined
                    ? const Color(0xff4999CB)
                    : Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
