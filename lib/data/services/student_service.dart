import 'dart:convert';
import 'package:challenge_dev_flutter/config/api_constants.dart';
import 'package:challenge_dev_flutter/domain/dtos/add_student_dto.dart';
import 'package:challenge_dev_flutter/domain/dtos/update_student_dto.dart';
import 'package:challenge_dev_flutter/utils/http_client.dart';
import 'package:challenge_dev_flutter/domain/dtos/get_student_dto.dart';

class StudentService {
  final String _studentUrl = ApiConstants.studentUrl;
  final HttpClientUtil _httpClient;

  StudentService({required HttpClientUtil httpClient})
    : _httpClient = httpClient;

  Future<List<GetStudentDto>?> fetchAllStudents() async {
    final response = await _httpClient.get(_studentUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => GetStudentDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<GetStudentDto?> fetchStudentById(String id) async {
    final response = await _httpClient.get('$_studentUrl/$id');
    if (response.statusCode == 200) {
      return GetStudentDto.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to load student');
    }
  }

  Future<void> addStudent(AddStudentDto student) async {
    final response = await _httpClient.post(
      _studentUrl,
      jsonEncode(student.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add student');
    }
  }

  Future<void> updateStudent(String id, UpdateStudentDto student) async {
    final response = await _httpClient.put(
      '$_studentUrl/$id',
      jsonEncode(student.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update student');
    }
  }

  Future<void> deleteStudent(String id) async {
    final response = await _httpClient.delete(ApiConstants.studentUrl, id);
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete student');
    }
  }
}
