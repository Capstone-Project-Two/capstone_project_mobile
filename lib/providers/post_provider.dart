import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _futurePosts = [];

  List<Post> get getPosts => _futurePosts;

  Future getAllPosts() async {
    _futurePosts = await GetService.fetchPosts();
    notifyListeners();
  }
}
