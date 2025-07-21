import 'package:challenge_dev_flutter/data/repositories/student_repository.dart';
import 'package:challenge_dev_flutter/domain/dtos/add_student_dto.dart';
import 'package:challenge_dev_flutter/domain/dtos/update_student_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentFormViewModel extends ChangeNotifier {
  final StudentRepository _studentRepository;
  final bool isEditMode;
  final String? studentId;

  StudentFormViewModel(
    this._studentRepository, {
    this.studentId,
    this.isEditMode = false,
  }) {
    if (isEditMode && studentId != null) {
      _loadStudentData();
    }
  }

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _cpfController = TextEditingController();
  final _academicRecordController = TextEditingController();
  final _emailController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get birthdateController => _birthdateController;
  TextEditingController get cpfController => _cpfController;
  TextEditingController get academicRecordController =>
      _academicRecordController;
  TextEditingController get emailController => _emailController;

  GlobalKey<FormState> get formKey => _formKey;

  String _formatCpf(String cpf) {
    // Remove qualquer formatação existente
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Aplica a máscara se tiver 11 dígitos
    if (cpf.length == 11) {
      return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9, 11)}';
    }

    return cpf;
  }

  Future<void> _loadStudentData() async {
    try {
      final student = await _studentRepository.getStudentById(studentId!);

      _nameController.text = student!.name;
      _birthdateController.text = DateFormat(
        'dd/MM/yyyy',
      ).format(student.birthdate);
      _cpfController.text = _formatCpf(student.cpf);
      _academicRecordController.text = student.academicRecord;
      _emailController.text = student.email;

      notifyListeners();
    } catch (e) {
      // TODO melhorar esse tratamento de erro com um dialog utils
      print('Erro ao carregar dados do estudante: $e');
    }
  }

  Future<void> addStudent(VoidCallback onSuccess, VoidCallback onError) async {
    try {
      final student = AddStudentDto(
        name: _nameController.text,
        email: _emailController.text,
        cpf: _cpfController.text,
        academicRecord: _academicRecordController.text,
        birthdate: _birthdateController.text,
      );

      await _studentRepository.addStudent(student);

      onSuccess();
    } catch (e) {
      onError();
    }
  }

  Future<void> editStudent(VoidCallback onSuccess, VoidCallback onError) async {
    try {
      final student = UpdateStudentDto(
        name: _nameController.text,
        email: _emailController.text,
        birthdate: _birthdateController.text,
      );

      await _studentRepository.updateStudent(studentId!, student);

      onSuccess();
    } catch (e) {
      onError();
    }
  }

  Future<void> submitForm(VoidCallback onSuccess, VoidCallback onError) async {
    if (!_formKey.currentState!.validate()) return;
    if (!isEditMode && studentId == null) {
      await addStudent(onSuccess, onError);
    } else {
      await editStudent(onSuccess, onError);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthdateController.dispose();
    _cpfController.dispose();
    _academicRecordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
