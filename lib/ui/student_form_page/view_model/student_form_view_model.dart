import 'package:challenge_dev_flutter/data/repositories/student_repository.dart';
import 'package:flutter/material.dart';

class StudentFormViewModel extends ChangeNotifier {
  final StudentRepository _studentRepository;

  StudentFormViewModel(this._studentRepository);
  final formKey = GlobalKey<FormState>();

  // void submitForm() {
  //   _studentRepository.addStudent(student);
  // }
}
