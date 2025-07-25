import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/constants/app_text_styles.dart';
import 'package:furnituremovers/core/widgets/custom_app_bar.dart';
import 'package:furnituremovers/screens/messages.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'جواد',
      'message': 'ايهه سيدي الله يفرج ',
      'image': 'assets/images/sticker.webp',
      'unread': true,
      'count': 1,
    },
    {
      'name': 'فاطمة الزهراء',
      'message': 'أنا بخير، شكرًا لك!',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
    {
      'name': 'سعيد البلوشي',
      'message': 'أحتاج لمساعدتك في مشروع.',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
    {
      'name': 'ليلى العلي',
      'message': 'هل لديك خطط لنهاية الأسبوع؟',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
    {
      'name': 'حسن الجبوري',
      'message': 'أريد أن أشاركك فكرة جديدة.',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
    {
      'name': 'مريم الناصر',
      'message': 'كيف كانت رحلتك الأخيرة؟',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
    {
      'name': 'يوسف السالم',
      'message': 'علينا التحدث عن ذلك في أقرب وقت.',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
    {
      'name': 'نورة الجهني',
      'message': 'هل تفضل القهوة أم الشاي؟',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
    {
      'name': 'عمر القحطاني',
      'message': 'ما رأيك في الأخبار الأخيرة؟',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
    {
      'name': 'سارة عبدالله',
      'message': 'أعجبني الكتاب الذي أوصيت به!',
      'image': 'assets/images/Profile picture.jpg',
      'unread': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "الشات"),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),

        itemCount: chats.length,
        separatorBuilder: (_, __) => Divider(
          height: 1.h,
          thickness: 0.8,
          color: AppColors.veryLightGrey,
        ),
        itemBuilder: (context, index) {
          final chat = chats[index];
          final bool hasUnread = chat['unread'] ?? false;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Messages()),
              );
            },
            child: Card(
              color: hasUnread ? AppColors.lightPrimaryGrey : AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              margin: EdgeInsets.zero,
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    CircleAvatar(
                      radius: 24.r,
                      backgroundImage: AssetImage(
                        chat['image'] ?? 'assets/images/Profile picture.jpg',
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            chat['name'],
                            style: AppTextStyles.heading2Ar.copyWith(
                              fontSize: 16.sp,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            chat['message'],
                            style: AppTextStyles.smallTextAr.copyWith(
                              fontSize: 14.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    if (hasUnread)
                      Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: const BoxDecoration(
                          color: AppColors.errorRed,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          chat['count'].toString(),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Almarai',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
