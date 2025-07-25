import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnituremovers/core/constants/app_colors.dart';
import 'package:furnituremovers/core/widgets/chat_InputBar.dart';
import 'package:furnituremovers/core/widgets/chat_bubble.dart';
import 'package:furnituremovers/core/widgets/custom_chatAppBar.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomChatAppBar(),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
              children: [
                _buildDateLabel("أمس"),
                ChatBubble(message: "Hello Ahmed", time: "2.5 pm", isMe: true),
                ChatBubble(
                  message: "How are you? are you fine?",
                  time: "2.5 pm",
                  isMe: true,
                ),
                ChatBubble(
                  message:
                      "Lorem ipsum dolor sit amet consectetur. Vivamus massa aenean varius etiam imperdiet placerat arcu.",
                  time: "2.5 pm",
                  isMe: true,
                ),
                ChatBubble(
                  message: "Hello Hassan",
                  time: "2.5 pm",
                  isMe: false,
                  showImage: true,
                ),
                ChatBubble(
                  message:
                      "Lorem ipsum dolor sit amet consectetur. Vivamus massa aenean varius etiam imperdiet placerat arcu.",
                  time: "2.5 pm",
                  isMe: false,
                ),
                _buildDateLabel("اليوم"),
                ChatBubble(message: "Hello Ahmed", time: "2.5 pm", isMe: true),
                ChatBubble(
                  message: "Lorem ipsum dolor sit amet",
                  time: "2.5 pm",
                  isMe: true,
                ),
              ],
            ),
          ),
          const SafeArea(bottom: true, top: false, child: ChatInputBar()),
        ],
      ),
    );
  }

  Widget _buildDateLabel(String text) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Almarai',
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
