import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart'; 

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: AppColors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Home.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? AppColors.primaryBlue : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/message.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? AppColors.primaryBlue : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'الشات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/wish-icon.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 2 ? AppColors.primaryBlue : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'المفضلة',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/person.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 3 ? AppColors.primaryBlue : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'البروفايل',
        ),
      ],
    );
  }
}