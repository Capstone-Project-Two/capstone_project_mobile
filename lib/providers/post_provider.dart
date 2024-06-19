import 'dart:io';

import 'package:capstone_project_mobile/model/dto/create_post.dart';
import 'package:capstone_project_mobile/model/post_model.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:capstone_project_mobile/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _allPosts = [];

  void setAllPosts(List<Post> newPosts) {
    _allPosts = newPosts;
    notifyListeners();
  }

  List<Post> get getAllPosts => _allPosts;

  late Post _onePost;
  Post get getOnePost => _onePost;
  void setOnePost(Post newPost) {
    _onePost = newPost;
    notifyListeners();
  }

  int _likeCount = 0;
  void setLikeCount(int newLikeCount) {
    _likeCount = newLikeCount;
    notifyListeners();
  }

  int get getLikeCount => _likeCount;

  Future<List<Post>> handleGetAllPosts() async {
    List<Post> posts = await GetService.fetchPosts()
        .then((value) => value)
        .catchError((err) => throw err);

    setAllPosts(posts);

    return _allPosts;
  }

  Future<Post> handleGetOnePost(String postId) async {
    Post post = await GetService.fetchOnePost(postId)
        .then((value) => value)
        .catchError((err) {
      throw err;
    });
    setOnePost(post);
    return post;
  }

  List<File> getAllPaths({List<XFile>? postImages}) {
    List<File> filePaths = [];
    for (int i = 0; i < postImages!.length; i++) {
      filePaths.add(File(postImages[i].path));
    }

    return filePaths;
  }

  Future handleCreatePost({
    required String body,
    List<XFile>? postImages,
  }) async {
    var res = await PostService.createPost(CreatePost(
      body: body,
      patient: "63686861790123456789abcd",
      postPhotos: getAllPaths(postImages: postImages ?? []),
    )).then(
      (value) async {
        return value;
      },
    ).catchError((err) {
      throw err;
    });

    return res;
  }

  Future handleGetLikeCount(String postId) async {
    Post post = await GetService.fetchOnePost(postId);
    setLikeCount(post.likeCount);
    return _likeCount;
  }

  Future handleLikePost(String postId) async {
    await PostService.likePost(
      id: postId,
      patientId: '72706f6e670123456789abcd',
    ).catchError((err) => throw err);

    Post post = await GetService.fetchOnePost(postId);
    setLikeCount(post.likeCount);
  }
}
