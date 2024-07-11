import 'dart:async';

import 'package:capstone_project_mobile/core/model/post.dart';
import 'package:capstone_project_mobile/core/services/get_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  List<Post> _allPosts = [];
  List<Post> get getAllPosts => _allPosts;
  void setAllPosts(List<Post> newPosts) {
    _allPosts = newPosts;
    update();
  }

  late Post _singlePost;
  Post get getSinglePost => _singlePost;
  void setSinglePost(Post post) {
    _singlePost = post;
    update();
  }

  Future<List<Post>> handleGetAllPosts() async {
    _allPosts = await GetService.fetchPosts();
    setAllPosts(_allPosts);
    return _allPosts;
  }

  Future<Post> handleGetOnePost(String postId) async {
    _singlePost = await GetService.fetchOnePost(postId);
    setSinglePost(_singlePost);
    return _singlePost;
  }
}
