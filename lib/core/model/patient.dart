import 'package:capstone_project_mobile/core/model/base_model.dart';

class Patient extends BaseModel {
  final String email;
  final String username;
  final String phoneNumber;
  final String gender;
  final bool isBanned;
  final List<dynamic> roles;

  Patient({
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.gender,
    required this.isBanned,
    required this.roles,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'email': String email,
        'username': String username,
        'phone_number': String phoneNumber,
        'gender': String gender,
        'is_banned': bool isBanned,
        'roles': List<dynamic> roles,
        '_id': String id,
        'createdAt': String createdAt,
        'updatedAt': String updatedAt,
      } =>
        Patient(
          email: email,
          gender: gender,
          isBanned: isBanned,
          phoneNumber: phoneNumber,
          username: username,
          roles: roles,
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ),
      _ => throw const FormatException('Failed to load patient.'),
    };
  }
}
