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
    String birthdateStr = json['birthdate'] as String;
    DateTime parseBirthdate(String value) {
      try {
        return DateTime.parse(value);
      } catch (_) {
        final parts = value.split('/');
        if (parts.length == 3) {
          final day = int.parse(parts[0]);
          final month = int.parse(parts[1]);
          final year = int.parse(parts[2]);
          return DateTime(year, month, day);
        }
        throw FormatException('Invalid date format', value);
      }
    }

    return ListStudentDto(
      id: json['id'] as String,
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      email: json['email'] as String,
      academicRecord: json['academic_record'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      birthdate: parseBirthdate(birthdateStr),
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
