import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _futurePosts = [];
  late Post _oneFuturePost;

  List<Post> get getFuturePosts => _futurePosts;
  Post get getOneFuturePost => _oneFuturePost;

  Future getAllPosts() async {
    _futurePosts = await GetService.fetchPosts()
        .then((value) => value)
        .catchError((err) => throw err);

    notifyListeners();
  }

  Future getOnePost(String postId) async {
    _oneFuturePost = await GetService.fetchOnePost(postId)
        .then((value) => value)
        .catchError((err) => throw err);

    notifyListeners();
  }
}
