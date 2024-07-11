import 'package:capstone_project_mobile/model/base_model.dart';

class ParentComment extends BaseModel {
  final String content;
  final CommentPatient patient;
  final String post;
  final String? parentComment;
  final List<ChildComment>? children;
  final int replyCount;

  ParentComment({
    required this.content,
    required this.patient,
    required this.post,
    this.parentComment,
    required this.children,
    required this.replyCount,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ParentComment.fromJson(Map<String, dynamic> json) {
    List<ChildComment> listParentComments = [];
    if (json['children'] != null) {
      for (var eachChild in json['children']) {
        if (eachChild is String) return listParentComments = json['children'];
        listParentComments.add(ChildComment.fromJson(eachChild));
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
        ParentComment(
          children: listParentComments,
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          content: content,
          replyCount: replyCount,
          patient: CommentPatient.fromJson(json['patient']),
          parentComment: json['parent'],
          post: post,
        ),
      _ => throw const FormatException('Failed to load patient comment')
    };
  }
}

class ChildComment extends BaseModel {
  final String content;
  final CommentPatient patient;
  final String post;
  final String? parentComment;
  final List<String>? children;
  final int replyCount;

  ChildComment({
    required this.content,
    required this.patient,
    required this.post,
    this.parentComment,
    required this.children,
    required this.replyCount,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ChildComment.fromJson(Map<String, dynamic> json) {
    List<String> listChildComments = [];
    if (json['children'] != null) {
      for (var eachChild in json['children']) {
        listChildComments.add(eachChild);
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
        ChildComment(
          content: content,
          patient: CommentPatient.fromJson(json['patient']),
          post: post,
          parentComment: json['parent'],
          children: listChildComments,
          replyCount: replyCount,
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ),
      _ => throw const FormatException('Cannot load child comment')
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
