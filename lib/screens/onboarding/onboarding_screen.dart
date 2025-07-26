import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/features/auth/presentation/screens/login_screen.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<_OnboardingData> _pages = [
    _OnboardingData(
      image: 'assets/images/asa1.png',
      title: 'نقل موثوق وسريع',
      description:
          'نقوم بنقل أثاثك بأمان إلى أي مكان بسرعة ودقة، دون عناء منك.',
    ),
    _OnboardingData(
      image: 'assets/images/onboarding2.png',
      title: 'كل ما تحتاجه لتصليحات المنزل',
      description:
          'فنيون محترفون جاهزون لخدمتك في أي وقت، من السباكة للكهرباء وأكثر.',
    ),
    _OnboardingData(
      image: 'assets/images/onboarding3.png',
      title: 'سهولة وسرعة في كل خطوة',
      description: 'من الحجز إلى التنفيذ، نضمن لك تجربة سريعة، بسيطة، وفعالة.',
    ),
  ];

  void _next() {
    if (_currentIndex < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // هني ننتقل لشاشة تسجيل الدخول
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  void _back() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (i) => setState(() => _currentIndex = i),
                  itemBuilder: (context, i) {
                    final data = _pages[i];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 8.h),
                          Center(
                            child: ClipPath(
                              clipper: BottomRoundedClipper(),
                              child: SizedBox(
                                width: 0.9.sw,
                                height: 280.h,
                                child: Image.asset(
                                  data.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            data.title,
                            style: AppTextStyles.heading1Ar,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            data.description,
                            style: AppTextStyles.bodyTextAr,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              onPressed: _next,
                              child: Text(
                                _currentIndex == _pages.length - 1
                                    ? 'ابدأ'
                                    : 'التالي',
                                style: AppTextStyles.buttonTextAr,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          if (_currentIndex > 0)
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: _back,
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  side: BorderSide(
                                    color: AppColors.primaryBlue,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                child: Text(
                                  'رجوع',
                                  style: AppTextStyles.buttonTextAr.copyWith(
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _pages.length,
                              (i) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                width: _currentIndex == i ? 20.w : 8.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                  color: _currentIndex == i
                                      ? AppColors.primaryBlue
                                      : AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingData {
  final String image;
  final String title;
  final String description;
  const _OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 30)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 30,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
