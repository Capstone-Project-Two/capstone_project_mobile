import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/components/lists/comments_list.dart';
import 'package:capstone_project_mobile/constants/route_constants.dart';
import 'package:capstone_project_mobile/core/controller/post_controller.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

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
      body: _buildBody(),
      bottomNavigationBar: _buildCommentButton(context),
    );
  }

  Widget _buildBody() {
    return Consumer<PostProvider>(
      builder: (context, postProvider, child) {
        return FutureBuilder(
          future: postProvider.handleGetOnePost(widget.postId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var post = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () async {
                  await postProvider.handleGetOnePost(widget.postId);
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PostCard(
                        post: post,
                        isCurrentPost: post.id == widget.postId,
                      ),
                      CommentsList(
                        postId: widget.postId,
                      ),
                    ],
                  ),
                ),
              );
            }

            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: ErrorScreen(
                  onTryAgain: () async {
                    await postProvider.handleGetOnePost(widget.postId);
                  },
                  errorObject: snapshot.error,
                ),
              );
            }

            return const LoadingScreen();
          },
        );
      },
    );
  }

  Widget _buildCommentButton(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      padding: const EdgeInsets.all(25.0),
      child: MyTextButton(
        onTap: () {
          Navigator.pushNamed(context, RouteConstant.commentPage.name);
        },
        icon: Icon(
          LucideIcons.messageCircle,
          color: colorScheme.tertiary,
        ),
        text: 'Write a comment',
      ),
    );
  }
}
