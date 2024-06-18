import 'package:capstone_project_mobile/model/base_model.dart';

class PatientComment extends BaseModel {
  final String content;
  final CommentPatient patient;
  final int replyCount;
  final String post;
  ParentComment? parent;
  final List<ParentComment> children;

  PatientComment({
    required this.content,
    required this.replyCount,
    required this.patient,
    required this.post,
    this.parent,
    required this.children,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PatientComment.fromJson(Map<String, dynamic> json) {
    List<ParentComment> listParentComments = [];
    if (json['children'] != null) {
      for (var eachChild in json['children']) {
        listParentComments.add(ParentComment.fromJson(eachChild));
      }
    }
    return switch (json) {
      {
        '_id': String id,
        'createdAt': String createdAt,
        'updatedAt': String updatedAt,
        'content': String content,
        'reply_count': int replyCount,
        'post': String post,
      } =>
        PatientComment(
          content: content,
          replyCount: replyCount,
          patient: CommentPatient.fromJson(json['patient']),
          post: post,
          parent: json['parent'] != null
              ? ParentComment.fromJson(json['parent'])
              : null,
          children: listParentComments,
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ),
      _ => throw const FormatException('Cannot load patient comment')
    };
  }
}

class ParentComment {
  final String content;
  final dynamic patient;
  final int replyCount;
  final dynamic post;

  ParentComment({
    required this.content,
    required this.replyCount,
    required this.patient,
    required this.post,
  });

  factory ParentComment.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'content': String content,
        'reply_count': int replyCount,
        'post': String post,
      } =>
        ParentComment(
          content: content,
          replyCount: replyCount,
          patient: CommentPatient.fromJson(json['patient']),
          post: post,
        ),
      _ => throw const FormatException('Failed to load patient comment')
    };
  }
}

class CommentPatient {
  final String id;
  final String username;

  CommentPatient({
    required this.id,
    required this.username,
  });

  factory CommentPatient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String id,
        'username': String username,
      } =>
        CommentPatient(id: id, username: username),
      _ => throw const FormatException('Failed to load Patient')
    };
  }
}
