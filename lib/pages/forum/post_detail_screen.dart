import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final String postId;
  const PostDetailScreen({super.key, required this.postId});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late Future<Post> futurePost;
  @override
  void initState() {
    super.initState();
    futurePost = GetService.fetchOnePost(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Detailed Post',
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var post = snapshot.data!;

              return PostCard(
                post: post,
                isCurrentPost: widget.postId == post.id,
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}
