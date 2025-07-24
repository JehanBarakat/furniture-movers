import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;
  final bool showImage;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isMe,
    this.showImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isMe && showImage)
            Padding(
              padding: EdgeInsets.only(right: 6.w),
              child: CircleAvatar(
                radius: 16.r,
                backgroundImage: const AssetImage(
                  'assets/images/Profile picture.jpg',
                ),
              ),
            ),

          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isMe ? AppColors.primaryBlue : AppColors.linearBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(isMe ? 16.r : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 16.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Almarai',
                        color: AppColors.white,
                        height: 1.4,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: 'Almarai',
                      color: AppColors.grey,
                    ),
                  ),
                  if (isMe) ...[
                    SizedBox(width: 4.w),
                    Icon(Icons.done_all, size: 18.sp, color: Color(0xFF00B5EE)),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
