import 'package:challenge_dev_flutter/domain/dtos/add_student_dto.dart';
import 'package:challenge_dev_flutter/domain/dtos/update_student_dto.dart';
import 'package:challenge_dev_flutter/domain/entities/student_entity.dart';

abstract class StudentRepositoryInterface {
  Future<List<Student>> getAllStudents();
  Future<Student?> getStudentById(String id);
  Future<void> addStudent(AddStudentDto student);
  Future<void> updateStudent(String id, UpdateStudentDto student);
  Future<void> deleteStudent(String id);
}
