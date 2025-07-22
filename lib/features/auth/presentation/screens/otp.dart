import 'package:flutter/material.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final void Function(String) onCompleted;

  const CustomOtpField({super.key, this.length = 6, required this.onCompleted});

  @override
  _CustomOtpFieldState createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  late List<bool> hasFocus;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
    hasFocus = List.generate(widget.length, (_) => false);

    for (int i = 0; i < widget.length; i++) {
      focusNodes[i].addListener(() {
        setState(() {
          hasFocus[i] = focusNodes[i].hasFocus;
        });
      });
    }
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  void checkCompletion() {
    String code = controllers.map((c) => c.text).join();
    if (code.length == widget.length) {
      widget.onCompleted(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return Container(
          width: 56, // عرض الخانة
          height: 48, // ارتفاع الخانة
          decoration: BoxDecoration(
            color: hasFocus[index] ? Colors.blue.shade50 : const Color(0xFFDEE2E6), // الخلفية حسب التركيز
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasFocus[index] ? Colors.blue : AppColors.regularGrey, // لون الحواف عند التركيز
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                maxLength: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.blue,
                showCursor: false, // إخفاء الخط الأزرق الوميض
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty && index < widget.length - 1) {
                    FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                  }
                  if (value.isEmpty && index > 0) {
                    FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                  }
                  checkCompletion();
                },
              ),

              // الخط الأزرق الأفقي داخل الخانة النشطة
              if (hasFocus[index])
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: AppColors.linearBlue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
