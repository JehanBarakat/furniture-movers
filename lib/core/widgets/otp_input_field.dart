import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart'; // استيراد الألوان المخصصة للمشروع

/// عنصر إدخال OTP يتكون من عدة حقول إدخال رقمية
class OTPInputField extends StatefulWidget {
  final int length; // عدد خانات OTP

  const OTPInputField({super.key, this.length = 6});

  @override
  OTPInputFieldState createState() => OTPInputFieldState();
}

class OTPInputFieldState extends State<OTPInputField> {
  late List<FocusNode> _focusNodes; // قائمة لإدارة التركيز على كل حقل
  late List<TextEditingController> _controllers; // قائمة للتحكم في محتوى كل حقل

  @override
  void initState() {
    super.initState();

    // إنشاء focus nodes و controllers حسب عدد الخانات
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _controllers = List.generate(widget.length, (_) => TextEditingController());

    // تحديث الواجهة عند تغيير حالة التركيز
    for (var node in _focusNodes) {
      node.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    // تحرير الموارد عند إغلاق العنصر
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  /// دالة لجلب الرمز الكامل المُدخل من الحقول
  String getCurrentCode() {
    return _controllers.map((c) => c.text).join();
  }

  /// دالة لمعالجة النصوص التي يتم لصقها في أحد الحقول
  void _handlePaste(String pastedText) {
    final cleanText = pastedText.replaceAll(RegExp(r'\D'), ''); // إزالة أي رموز غير رقمية
    final chars = cleanText.split('');

    for (int i = 0; i < widget.length && i < chars.length; i++) {
      _controllers[i].text = chars[i];
    }

    // نقل التركيز للحقل التالي أو إنهاء التركيز إذا تم ملء كل الحقول
    if (chars.length < widget.length) {
      _focusNodes[chars.length].requestFocus();
    } else {
      _focusNodes.last.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.length, (index) {
          return Container(
            width: 56,
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 5),

            // مستمع لأحداث الكيبورد (مثل Backspace)
            child: KeyboardListener(
              focusNode: FocusNode(), // FocusNode خاص بالمستمع
              onKeyEvent: (event) {
                if (event is KeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.backspace &&
                    _controllers[index].text.isEmpty &&
                    index > 0) {
                  _focusNodes[index - 1].requestFocus(); // الرجوع للحقل السابق
                  _controllers[index - 1].clear(); // مسح محتوى الحقل السابق
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TextField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1, // يسمح بإدخال رقم واحد فقط
                    focusNode: _focusNodes[index],
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // قبول الأرقام فقط
                    ],
                    onChanged: (value) {
                      // إذا تم لصق نص يحتوي أكثر من رقم
                      if (value.length > 1) {
                        _handlePaste(value);
                        return;
                      }

                      // إذا أدخل المستخدم رقمًا، انتقل للحقل التالي
                      if (value.isNotEmpty && index < widget.length - 1) {
                        _focusNodes[index + 1].requestFocus();
                      }
                    },
                    decoration: InputDecoration(
                      counterText: '', // إخفاء عداد الحروف
                      filled: true,
                      fillColor: AppColors.veryLightGrey, // لون خلفية الحقل
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.primaryBlue),
                      ),
                    ),
                  ),

                  // خط  أزرق يظهر في الحقل عند التركيز
                  if (_focusNodes[index].hasFocus)
                    const Positioned(
                      bottom: 14,
                      child: SizedBox(
                        width: 23.8,
                        height: 2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: AppColors.primaryBlue),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
