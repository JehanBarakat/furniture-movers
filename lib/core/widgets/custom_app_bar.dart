import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onTrailingPressed;
  final Widget trailingIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.trailingIcon,
    this.onTrailingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: AppTextStyles.heading1Ar,
          ),
          actions: [
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.white, // خلفية بيضاء للمربع
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.lightGrey),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onTrailingPressed ?? () {},
                icon: SizedBox(
                  width: 16,
                  height: 16,
                  child: IconTheme(
                    data: IconThemeData(color: AppColors.lightGrey),
                    child: trailingIcon,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: AppColors.lightGrey,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
