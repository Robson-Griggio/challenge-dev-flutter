import 'package:challenge_dev_flutter/data/repositories/interfaces/student_repository_interface.dart';
import 'package:challenge_dev_flutter/domain/entities/student_entity.dart';

class StudentRepository implements StudentRepositoryInterface {
  @override
  Future<void> addStudent(Student student) {
    // TODO: implement addStudent
    throw UnimplementedError();
  }

  @override
  Future<void> deleteStudent(String id) {
    // TODO: implement deleteStudent
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> getAllStudents() {
    // TODO: implement getAllStudents
    throw UnimplementedError();
  }

  @override
  Future<Student?> getStudentById(String id) {
    // TODO: implement getStudentById
    throw UnimplementedError();
  }

  @override
  Future<void> updateStudent(Student student) {
    // TODO: implement updateStudent
    throw UnimplementedError();
  }
}
