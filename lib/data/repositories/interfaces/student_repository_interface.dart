import 'package:challenge_dev_flutter/domain/entities/student_entity.dart';

abstract class StudentRepositoryInterface {
  Future<List<Student>> getAllStudents();
  Future<Student?> getStudentById(String id);
  Future<void> addStudent(Student student);
  Future<void> updateStudent(Student student);
  Future<void> deleteStudent(String id);
}
