import 'package:capstone_project_mobile/core/model/base_model.dart';

class Patient extends BaseModel {
  final String email;
  final String password;
  final String username;
  final String phoneNumber;
  final String gender;
  final String? refreshToken;
  final bool isBanned;
  final List<dynamic> roles;

  Patient({
    required this.email,
    required this.password,
    required this.username,
    required this.phoneNumber,
    required this.gender,
    this.refreshToken,
    required this.isBanned,
    required this.roles,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        // 'email': String email,
        'credential': {'email': String email, 'password': String password},
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
          password: password,
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
