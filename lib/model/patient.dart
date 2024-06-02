import 'package:capstone_project_mobile/model/base_model.dart';
import 'package:capstone_project_mobile/model/post.dart';

class Patient extends BaseModel {
  final String email;
  final String username;
  final String phoneNumber;
  final String gender;
  final bool isBanned;
  final List<dynamic> roles;
  final List<Post> posts;

  Patient({
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.gender,
    required this.isBanned,
    required this.roles,
    required this.posts,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    List<Post> getPost() {
      List<Post> posts = [];

      for (var eachPost in json['posts']) {
        posts.add(Post.fromJson(eachPost));
      }

      return posts;
    }

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
          posts: getPost(),
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ),
      _ => throw const FormatException('Failed to load patient.'),
    };
  }
}
