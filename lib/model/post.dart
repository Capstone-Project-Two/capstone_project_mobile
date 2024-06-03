import 'package:capstone_project_mobile/model/base_model.dart';
import 'package:capstone_project_mobile/model/patient.dart';

class Post extends BaseModel {
  final String body;
  final int likeCount;
  final Patient patient;

  Post({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.body,
    required this.likeCount,
    required this.patient,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String id,
        'createdAt': String createdAt,
        'updatedAt': String updatedAt,
        'body': String body,
        'like_count': int likeCount,
      } =>
        Post(
          body: body,
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          likeCount: likeCount,
          patient: Patient.fromJson(json['patient']),
        ),
      _ => throw const FormatException('Failed to load post'),
    };
  }
}
