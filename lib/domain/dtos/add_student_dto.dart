class AddStudentDto {
  final String name;
  final String email;
  final DateTime birthdate;
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
      birthdate: DateTime.parse(json['birthdate'] as String),
      academicRecord: json['academic_record'] as String,
      cpf: json['cpf'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'birthdate': birthdate.toIso8601String(),
      'academic_record': academicRecord,
      'cpf': cpf,
    };
  }
}
