import 'package:flutter/material.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/features/settings/presentation/screens/about_app.dart';
import 'package:furnituremovers/features/settings/presentation/screens/app-model.dart';
import 'package:furnituremovers/features/settings/presentation/screens/app_language.dart';
import 'package:furnituremovers/features/settings/presentation/screens/concat-us.dart';
import 'package:furnituremovers/features/settings/presentation/screens/term&condditions.dart';
import 'reset_password_screen.dart';
import 'otp_screen.dart';
import 'logout_confirm_dialog.dart';
import 'logout_loading_screen.dart';

/// صفحة البروفايل الرئيسية
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryBlue,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'الملف الشخصي',
          style: TextStyle(
            fontFamily: 'Almarai',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
        // لا يوجد actions
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // صورة البروفايل والاسم
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'assets/images/Profile picture.jpg',
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'محمد علي',
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(2),
                      child: const Icon(
                        Icons.verified,
                        color: AppColors.primaryBlue,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  '009677356464774',
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontSize: 13,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // الحساب
            _SectionTitle(title: 'الحساب'),
            _ProfileCard(
              children: [
                _ProfileListTile(
                  title: 'تغيير رقم الهاتف',
                  icon: Icons.phone,
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => OTPScreen()));
                  },
                ),
                _ProfileListTile(
                  title: 'تغيير كلمة المرور',
                  icon: Icons.lock_outline,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ResetPasswordScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // التفضيلات
            _SectionTitle(title: 'التفضيلات'),
            _ProfileCard(
              children: [
                _ProfileListTile(
                  title: 'لغة التطبيق',
                  icon: Icons.language,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const AppLanguageScreen(),
                      ),
                    );
                  },
                ),
                _ProfileListTile(
                  title: 'مود التطبيق',
                  icon: Icons.wb_sunny_outlined,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AppModeScreen()),
                    );
                  },
                ),
              ],
            ),
            // السياسات والخصوصية
            _SectionTitle(title: 'السياسات والخصوصية'),
            _ProfileCard(
              children: [
                _ProfileListTile(
                  title: 'تواصل بنا',
                  icon: Icons.mail_outline,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ContactUsScreen(),
                      ),
                    );
                  },
                ),
                _ProfileListTile(
                  title: 'شروط الخدمة',
                  icon: Icons.description_outlined,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const TermsAndConditionsScreen(),
                      ),
                    );
                  },
                ),
                _ProfileListTile(
                  title: 'حول التطبيق',
                  icon: Icons.info_outline,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AboutAppScreen()),
                    );
                  },
                ),
                _ProfileListTile(
                  title: 'تسجيل خروج',
                  icon: Icons.logout,
                  iconColor: AppColors.logoutRed,
                  onTap: () async {
                    // عند الضغط على تسجيل خروج، أظهر حوار التأكيد
                    final result = await showDialog(
                      context: context,
                      builder: (context) => const LogoutConfirmDialog(),
                    );
                    // إذا وافق المستخدم، انتقل إلى صفحة التحميل
                    if (result == true) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const LogoutLoadingScreen(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// عنوان القسم
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 24, top: 16, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Almarai',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColors.grey,
        ),
      ),
    );
  }
}

/// كارد الخيارات
class _ProfileCard extends StatelessWidget {
  final List<Widget> children;
  const _ProfileCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: [...children]),
    );
  }
}

/// عنصر خيار في القائمة
class _ProfileListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  const _ProfileListTile({
    required this.title,
    required this.icon,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
          ),
          leading: Icon(icon, color: iconColor ?? AppColors.primaryBlue),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Almarai',
              fontSize: 15,
              color: AppColors.black,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: AppColors.primaryBlue,
          ),
          onTap: onTap,
        ),
        const Divider(height: 1, color: AppColors.lightPrimaryGrey),
      ],
    );
  }
}
