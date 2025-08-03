import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee_comment.dart';

class EmployeeService {
  static const String baseUrl = 'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1';
  static const String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw';
  static const String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw';

  static Future<List<EmployeeComment>> getEmployeeComments(int employeeId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/employee_questions?employee_id=eq.$employeeId'),
        headers: {
          'Authorization': token,
          'apikey': apiKey,
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => EmployeeComment.fromJson(json)).toList();
      } else {
        throw Exception('فشل في جلب التعليقات: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ في الاتصال: $e');
    }
  }

  static Future<Map<String, dynamic>?> getEmployeeDetails(int employeeId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/employees?id=eq.$employeeId'),
        headers: {
          'Authorization': token,
          'apikey': apiKey,
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.isNotEmpty ? jsonData.first : null;
      } else {
        throw Exception('فشل في جلب تفاصيل الموظف: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ في الاتصال: $e');
    }
  }
} 