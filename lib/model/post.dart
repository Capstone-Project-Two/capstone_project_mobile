import 'package:capstone_project_mobile/model/base_model.dart';
import 'package:capstone_project_mobile/model/patient.dart';
import 'package:capstone_project_mobile/model/post_photo.dart';

class Post extends BaseModel {
  final String body;
  final int likeCount;
  final Patient patient;
  final List<PostPhoto> postPhotos;

  Post({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.body,
    required this.likeCount,
    required this.patient,
    required this.postPhotos,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    List<PostPhoto> listPhotos = [];
    if (json['postPhotos'] != null) {
      for (var eachPostPhoto in json['postPhotos']) {
        listPhotos.add(PostPhoto.fromJson(eachPostPhoto));
      }
    }

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
          postPhotos: listPhotos,
        ),
      _ => throw const FormatException('Failed to load post'),
    };
  }
}
