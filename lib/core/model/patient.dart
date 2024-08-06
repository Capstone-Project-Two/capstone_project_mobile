import 'package:capstone_project_mobile/core/model/base_model.dart';
import 'package:capstone_project_mobile/core/model/credential.dart';

class Patient extends BaseModel {
  final Credential credential;
  final String username;
  final String phoneNumber;
  final String gender;
  final String? refreshToken;
  final int credits;
  final bool isBanned;
  final List<dynamic> roles;
  final int stressMonitorCount;
  final int mindCheckupCount;
  final String profileImg;

  Patient({
    required this.credential,
    required this.username,
    required this.phoneNumber,
    required this.gender,
    this.refreshToken,
    required this.credits,
    required this.isBanned,
    required this.roles,
    required this.mindCheckupCount,
    required this.stressMonitorCount,
    required this.profileImg,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'username': String username,
        'phone_number': String phoneNumber,
        'gender': String gender,
        'credits': int credits,
        'is_banned': bool isBanned,
        'roles': List<dynamic> roles,
        '_id': String id,
        'createdAt': String createdAt,
        'updatedAt': String updatedAt,
        'stress_monitor_count': int stressMonitorCount,
        'mind_checkup_count': int mindCheckupCount,
        'profile_img': String profileImg,
      } =>
        Patient(
          credential: Credential.fromJson(json['credential']),
          profileImg: profileImg,
          mindCheckupCount: mindCheckupCount,
          stressMonitorCount: stressMonitorCount,
          gender: gender,
          isBanned: isBanned,
          phoneNumber: phoneNumber,
          credits: credits,
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
