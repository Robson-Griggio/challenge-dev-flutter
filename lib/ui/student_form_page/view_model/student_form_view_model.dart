import 'package:challenge_dev_flutter/data/repositories/student_repository.dart';
import 'package:challenge_dev_flutter/domain/dtos/add_student_dto.dart';
import 'package:flutter/material.dart';

class StudentFormViewModel extends ChangeNotifier {
  final StudentRepository _studentRepository;

  StudentFormViewModel(this._studentRepository);
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _birthdate;
  String? _cpf;
  String? _academicRecord;
  String? _email;

  get formKey => _formKey;

  set name(String? value) {
    _name = value;
    notifyListeners();
  }

  set birthdate(String? value) {
    _birthdate = value;
    notifyListeners();
  }

  set cpf(String? value) {
    _cpf = value?.replaceAll('.', '').replaceAll('-', '');
    notifyListeners();
  }

  set academicRecord(String? value) {
    _academicRecord = value;
    notifyListeners();
  }

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  Future<void> submitForm(VoidCallback onSuccess, VoidCallback onError) async {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState!.save();

    try {
      final student = AddStudentDto(
        name: _name!,
        email: _email!,
        cpf: _cpf!,
        academicRecord: _academicRecord!,
        birthdate: _birthdate!,
      );

      await _studentRepository.addStudent(student);
      onSuccess();
    } catch (e) {
      onError();
    }
  }
}
