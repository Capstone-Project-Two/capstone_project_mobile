import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/core/controller/post_controller.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailScreen extends StatefulWidget {
  final String postId;
  const PostDetailScreen({super.key, required this.postId});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Detailed Post',
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: postController.handleGetOnePost(widget.postId),
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
