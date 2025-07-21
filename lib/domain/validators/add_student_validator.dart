import 'package:challenge_dev_flutter/domain/dtos/add_student_dto.dart';

class AddStudentValidator {
  Map<String, String> validate(AddStudentDto student) {
    final errors = <String, String>{};

    if (student.name.trim().isEmpty) {
      errors['name'] = 'Name is required.';
    }

    if (!_isValidCpf(student.cpf)) {
      errors['cpf'] = 'Invalid CPF.';
    }

    if (!_isValidEmail(student.email)) {
      errors['email'] = 'Invalid email address.';
    }

    if (student.academicRecord.trim().isEmpty) {
      errors['academicRecord'] = 'Academic record is required.';
    }

    if (student.birthdate.isAfter(DateTime.now())) {
      errors['birthdate'] = 'Birthdate cannot be in the future.';
    }

    return errors;
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(email);
  }

  bool _isValidCpf(String cpf) {
    final cleaned = cpf.replaceAll(RegExp(r'\D'), '');
    if (cleaned.length != 11) return false;
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cleaned)) return false;
    return true;
  }
}
