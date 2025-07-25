import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListTile extends StatelessWidget {
  final String name;
  final String message;
  final String imagePath;
  final bool hasUnread;
  final int unreadCount;
  final VoidCallback onTap;

  const ChatListTile({
    super.key,
    required this.name,
    required this.message,
    required this.imagePath,
    required this.onTap,
    this.hasUnread = false,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        color: hasUnread ? const Color(0xFFF0F6FE) : Colors.white,
        child: Row(
          children: [
            if (hasUnread)
              Container(
                width: 24.w,
                height: 24.w,
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  unreadCount.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),

            SizedBox(width: 4.w), // مسافة بسيطة

            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 24.r, // ← Radius قابل للتجاوب
            ),

            SizedBox(width: 12.w), // مسافة بين الصورة والنص

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp, // حجم خط متجاوب
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    message,
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
