# نظام عرض تعليقات الموظفين

## 📋 نظرة عامة
نظام متكامل لعرض التعليقات والأسئلة المرتبطة بالموظفين في تطبيق نقل الأثاث. يعتمد النظام على Supabase كقاعدة بيانات وAPI.

## 🗂️ الملفات المضافة

### 1. النماذج (Models)
- **`lib/core/models/employee_comment.dart`**
  - نموذج `EmployeeComment` لتمثيل بيانات التعليقات
  - يحتوي على: id, employeeId, question, answer, rating, createdAt, updatedAt
  - يدعم تحويل JSON إلى كائن والعكس

### 2. الخدمات (Services)
- **`lib/core/services/employee_service.dart`**
  - `getEmployeeComments(int employeeId)`: جلب تعليقات موظف معين
  - `getEmployeeDetails(int employeeId)`: جلب تفاصيل الموظف
  - يستخدم Supabase API مع التوثيق المناسب

### 3. التكامل مع الواجهات الموجودة
- **`lib/screens/tabBar/service_details_page.dart`**
  - تم دمج نظام التعليقات في الواجهة الموجودة
  - يستخدم API لجلب التعليقات الحقيقية
  - يدعم: التحميل، معالجة الأخطاء، البيانات الاحتياطية
  - زر تحديث في AppBar

## 🔧 التكوين

### API Configuration
```dart
static const String baseUrl = 'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1';
static const String token = 'Bearer [YOUR_TOKEN]';
static const String apiKey = '[YOUR_API_KEY]';
```

### Dependencies
أضف في `pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.0
```

## 🚀 الاستخدام

### 1. الوصول إلى التعليقات
النظام مدمج في `service_details_page.dart`. عند فتح صفحة تفاصيل الخدمة، ستجد:
- تبويب "الأسئلة" يحتوي على التعليقات من API
- زر تحديث في AppBar
- معالجة شاملة للأخطاء وحالات التحميل

### 2. جلب التعليقات برمجياً
```dart
try {
  final comments = await EmployeeService.getEmployeeComments(employeeId);
  // استخدام التعليقات
} catch (e) {
  // معالجة الخطأ
}
```

## 📊 هيكل البيانات

### EmployeeComment Model
```json
{
  "id": 1,
  "employee_id": 1,
  "question": "نص السؤال",
  "answer": "نص الإجابة",
  "rating": 4.5,
  "created_at": "2025-01-21T10:00:00Z",
  "updated_at": "2025-01-21T10:00:00Z"
}
```

## 🎨 الميزات

### ✅ الميزات المنجزة
- [x] عرض قائمة التعليقات
- [x] معالجة حالات التحميل
- [x] معالجة الأخطاء
- [x] عرض الحالة الفارغة
- [x] تحديث البيانات (Pull to Refresh)
- [x] تصميم جميل ومتجاوب
- [x] دعم اللغة العربية
- [x] عرض التقييمات بالنجوم
- [x] تنسيق التواريخ

### 🔄 الميزات المستقبلية
- [ ] إضافة تعليق جديد
- [ ] تعديل التعليقات
- [ ] حذف التعليقات
- [ ] تصفية التعليقات
- [ ] البحث في التعليقات
- [ ] تصدير التعليقات

## 🛠️ استكشاف الأخطاء

### مشاكل شائعة وحلولها

1. **خطأ في الاتصال**
   - تأكد من صحة الـ URL والـ Token
   - تحقق من اتصال الإنترنت

2. **خطأ 401 (Unauthorized)**
   - تأكد من صحة الـ API Key
   - تحقق من صلاحية الـ Token

3. **خطأ 404 (Not Found)**
   - تأكد من وجود الموظف في قاعدة البيانات
   - تحقق من صحة employee_id

4. **خطأ في تحليل JSON**
   - تأكد من صحة هيكل البيانات
   - تحقق من وجود الحقول المطلوبة

## 📱 اختبار النظام

1. شغل التطبيق
2. انتقل إلى صفحة تفاصيل الخدمة (`service_details_page.dart`)
3. اضغط على تبويب "الأسئلة"
4. ستظهر التعليقات من API مع إمكانية التحديث

## 🔐 الأمان

- جميع الطلبات تستخدم HTTPS
- التوثيق يتم عبر Bearer Token
- API Key مطلوب لجميع الطلبات
- البيانات محمية عبر Supabase RLS

## 📞 الدعم

لأي استفسارات أو مشاكل:
- تحقق من ملف `app_colors.dart` للتأكد من وجود `primaryColor`
- تأكد من إضافة dependency الـ `http`
- تحقق من صحة بيانات API في `employee_service.dart` 