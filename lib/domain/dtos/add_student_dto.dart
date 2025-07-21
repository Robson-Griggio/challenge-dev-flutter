import 'package:intl/intl.dart';

class AddStudentDto {
  final String name;
  final String email;
  final String birthdate;
  final String academicRecord;
  final String cpf;

  AddStudentDto({
    required this.name,
    required this.email,
    required this.birthdate,
    required this.academicRecord,
    required this.cpf,
  });

  factory AddStudentDto.fromJson(Map<String, dynamic> json) {
    return AddStudentDto(
      name: json['name'] as String,
      email: json['email'] as String,
      birthdate: json['birthdate'] as String,
      academicRecord: json['academic_record'] as String,
      cpf: json['cpf'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parsedDate = DateFormat('dd/MM/yyyy').parse(birthdate);
    final formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return {
      'name': name,
      'email': email,
      'birthdate': formattedDate,
      'academic_record': academicRecord,
      'cpf': cpf,
    };
  }
}
