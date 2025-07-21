import 'package:challenge_dev_flutter/data/repositories/interfaces/student_repository_interface.dart';
import 'package:challenge_dev_flutter/data/services/student_service.dart';
import 'package:challenge_dev_flutter/domain/entities/student_entity.dart';

class StudentRepository implements StudentRepositoryInterface {
  final StudentService _service;
  StudentRepository({required StudentService service}) : _service = service;

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
  Future<List<Student>> getAllStudents() async {
    try {
      final dtoList = await _service.fetchAllStudents();

      if (dtoList == null) {
        return [];
      }

      return dtoList
          .map(
            (dto) => Student(
              id: dto.id,
              cpf: dto.cpf,
              name: dto.name,
              email: dto.email,
              academicRecord: dto.academicRecord,
              createdAt: dto.createdAt,
              birthdate: dto.birthdate,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load students');
    }
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
