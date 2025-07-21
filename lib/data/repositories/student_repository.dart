import 'package:challenge_dev_flutter/data/repositories/interfaces/student_repository_interface.dart';
import 'package:challenge_dev_flutter/data/services/student_service.dart';
import 'package:challenge_dev_flutter/domain/dtos/add_student_dto.dart';
import 'package:challenge_dev_flutter/domain/dtos/update_student_dto.dart';
import 'package:challenge_dev_flutter/domain/entities/student_entity.dart';

class StudentRepository implements StudentRepositoryInterface {
  final StudentService _service;
  StudentRepository({required StudentService service}) : _service = service;

  @override
  Future<void> addStudent(AddStudentDto student) async {
    try {
      final studentDto = AddStudentDto(
        name: student.name,
        email: student.email,
        cpf: student.cpf,
        academicRecord: student.academicRecord,
        birthdate: student.birthdate,
      );
      await _service.addStudent(studentDto);
    } catch (e) {
      throw Exception('Failed to add student in repository: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteStudent(String id) async {
    try {
      await _service.deleteStudent(id);
    } catch (e) {
      throw Exception(
        'Failed to delete student in repository: ${e.toString()}',
      );
    }
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
      throw Exception('Failed to load students in repository: ${e.toString()}');
    }
  }

  @override
  Future<Student?> getStudentById(String id) async {
    try {
      final dto = await _service.fetchStudentById(id);

      if (dto == null) {
        return null;
      }

      return Student(
        id: dto.id,
        cpf: dto.cpf,
        name: dto.name,
        email: dto.email,
        academicRecord: dto.academicRecord,
        createdAt: dto.createdAt,
        birthdate: dto.birthdate,
      );
    } catch (e) {
      throw Exception('Failed to load student in repository: ${e.toString()}');
    }
  }

  @override
  Future<void> updateStudent(String id, UpdateStudentDto student) async {
    try {
      final studentDto = UpdateStudentDto(
        name: student.name,
        email: student.email,
        birthdate: student.birthdate,
      );
      await _service.updateStudent(id, studentDto);
    } catch (e) {
      throw Exception(
        'Failed to update student in repository: ${e.toString()}',
      );
    }
  }
}
