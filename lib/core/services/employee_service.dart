import 'dart:convert';
import 'package:furnituremovers/model/employee_question.dart';
import 'package:http/http.dart' as http;
import 'package:furnituremovers/model/employee.dart';
import 'package:furnituremovers/model/main_service.dart';
import 'package:furnituremovers/model/profile.dart';

class EmployeeService {
  static const String _baseUrl =
      'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1';
  static const String _apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw';

  static Future<List<Employee>> getEmployees() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/employees'),
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Employee.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load employees: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load employees: $e');
    }
  }

  static Future<List<MainService>> getMainServices() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/main_services'),
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => MainService.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load main services: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load main services: $e');
    }
  }

  static Future<Profile?> getProfile() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/profile'),
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        if (jsonData.isNotEmpty) {
          return Profile.fromJson(jsonData.first);
        }
        return null;
      } else {
        throw Exception('Failed to load profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load profile: $e');
    }
  }

  static Future<List<EmployeeQuestion>> getEmployeeQuestions(
    int employeeId,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/employee_questions?employee_id=eq.$employeeId'),
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => EmployeeQuestion.fromJson(item)).toList();
      } else {
        throw Exception(
          'Failed to load employee questions: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error loading employee questions: $e');
    }
  }
}
