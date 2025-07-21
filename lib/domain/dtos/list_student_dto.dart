class ListStudentDto {
  final String id;
  final String name;
  final String cpf;
  final String email;
  final String academicRecord;
  final DateTime createdAt;
  final DateTime birthdate;

  ListStudentDto({
    required this.id,
    required this.name,
    required this.cpf,
    required this.email,
    required this.academicRecord,
    required this.createdAt,
    required this.birthdate,
  });

  factory ListStudentDto.fromJson(Map<String, dynamic> json) {
    return ListStudentDto(
      id: json['id'].toString(),
      name: json['name'].toString(),
      cpf: json['cpf'].toString(),
      email: json['email'].toString(),
      academicRecord: json['academic_record'].toString(),
      createdAt: DateTime.parse(json['createdAt'].toString()),
      birthdate: DateTime.parse(json['createdAt'].toString()),
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
      'birthdate': birthdate.toIso8601String(),
    };
  }
}
