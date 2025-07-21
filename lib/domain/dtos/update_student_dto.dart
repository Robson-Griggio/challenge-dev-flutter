import 'package:intl/intl.dart';

class UpdateStudentDto {
  final String name;
  final String email;
  final String birthdate;

  UpdateStudentDto({
    required this.name,
    required this.email,
    required this.birthdate,
  });

  factory UpdateStudentDto.fromJson(Map<String, dynamic> json) {
    return UpdateStudentDto(
      name: json['name'] as String,
      email: json['email'] as String,
      birthdate: json['birthdate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parsedDate = DateFormat('dd/MM/yyyy').parse(birthdate);
    final formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return {'name': name, 'email': email, 'birthdate': formattedDate};
  }
}
