class StudentDto {
  final String id;
  final String name;
  final String cpf;
  final String email;
  final String academicRecord;
  final DateTime createdAt;
  final DateTime birthdate;

  StudentDto({
    required this.id,
    required this.name,
    required this.cpf,
    required this.email,
    required this.academicRecord,
    required this.createdAt,
    required this.birthdate,
  });

  factory StudentDto.fromJson(Map<String, dynamic> json) {
    return StudentDto(
      id: json['id'] as String,
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      email: json['email'] as String,
      academicRecord: json['academic_record'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      birthdate: DateTime.parse(json['birthdate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'email': email,
      'academic_record': academicRecord,
      'createdAt': createdAt.toIso8601String(),
      'birthdate': birthdate.toIso8601String().split('T').first,
    };
  }
}
