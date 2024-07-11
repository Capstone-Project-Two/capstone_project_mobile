import 'dart:async';

import 'package:capstone_project_mobile/core/model/post.dart';
import 'package:capstone_project_mobile/core/services/get_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  List<Post> _futurePosts = [];

  List<Post> get getPosts => _futurePosts;

  Future<List<Post>> handleGetAllPosts() async {
    _futurePosts = await GetService.fetchPosts();
    update();
    return _futurePosts;
  }
}
