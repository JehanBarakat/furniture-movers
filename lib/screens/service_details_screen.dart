// service_details_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // لاستخدام نفس الخط الموجود في الشاشة الرئيسية
    final textTheme = GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          // زر العودة التلقائي يظهر عند استخدام Navigator.push
          // leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            'نقل الأثاث',
            style: textTheme.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 20),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. الصورة العلوية
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    'https://i.imgur.com/qL3p3aY.png', // استخدمت صورة مشابهة
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 2. عنوان القسم
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'الفنيون الموجودون في الخدمة',
                  style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              // 3. قائمة الفنيين
              ListView.builder(
                itemCount: 3, // عدد البطاقات كما في الصورة
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                   // بيانات وهمية للبطاقات
                  final worker = {
                    'name': index == 0 ? 'محمد حسن احمد' : 'علي عبدالله سعيد',
                    'job': index == 0 ? 'مهندس كهربائي' : 'ناقل أثاث',
                    'imageUrl': index == 0
                        ? 'https://i.pravatar.cc/150?img=68'
                        : 'https://i.pravatar.cc/150?img=60',
                  };
                  return _buildTechnicianCard(context, worker, textTheme);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// ويدجت لبناء بطاقة الفني
  Widget _buildTechnicianCard(BuildContext context, Map<String, String> worker, TextTheme textTheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // التفاصيل (الاسم، المهنة، التقييم، الزر) - على اليمين
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(worker['name']!, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(worker['job']!, style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (i) => Icon(i < 4 ? Icons.star : Icons.star_border, color: Colors.amber, size: 20)),
                  ),
                  const SizedBox(height: 12),
                  // زر "احجز الآن" مع تدرج لوني
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF4A90E2), Color(0xFF007BFF)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('احجز الآن', style: textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // الصورة - على اليسار
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    worker['imageUrl']!,
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite, color: Color(0xFFE94560), size: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
