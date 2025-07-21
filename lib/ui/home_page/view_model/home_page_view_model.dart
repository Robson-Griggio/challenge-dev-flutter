import 'package:challenge_dev_flutter/data/repositories/student_repository.dart';
import 'package:challenge_dev_flutter/domain/entities/student_entity.dart';
import 'package:challenge_dev_flutter/utils/command_pattern.dart';
import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  final StudentRepository _studentRepository;
  late final Command0<List<Student>> getAllStudentsCommand;

  HomePageViewModel(this._studentRepository) {
    getAllStudentsCommand = Command0(() => _studentRepository.getAllStudents());
    getAllStudentsCommand.execute();
  }

  get reloadAllStudents => getAllStudentsCommand.execute();

  Future<void> deleteStudent({
    required String id,
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    try {
      await _studentRepository.deleteStudent(id);
      onSuccess();
    } catch (e) {
      onError();
    }

    reloadAllStudents();
  }
}
