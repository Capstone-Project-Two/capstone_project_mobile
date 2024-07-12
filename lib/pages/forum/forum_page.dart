import 'package:capstone_project_mobile/components/buttons/floating_post_button.dart';
import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/shared/error_screen.dart';
import 'package:capstone_project_mobile/core/controller/post_controller.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  bool loading = false;
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingPostButton(),
      body: RefreshIndicator(
        onRefresh: postController.handleGetAllPosts,
        child: FutureBuilder(
          future: postController.handleGetAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var posts = snapshot.data!;
              return ListView.builder(
                itemCount: postController.getAllPosts.length,
                itemBuilder: (ctx, index) {
                  return PostCard(
                    post: posts[index],
                    isCurrentPost: false,
                  );
                },
              );
            }
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: ErrorScreen(
                  onTryAgain: () async {
                    await postController.handleGetAllPosts();
                  },
                  errorObject: snapshot.error,
                ),
              );
            }
            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}
