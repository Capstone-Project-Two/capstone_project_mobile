import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  late Future<List<Post>> futurePosts;

  Future handleRefresh() async {
    futurePosts = fetchPosts();
    notifyListeners();
  }
}
