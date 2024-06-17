import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/components/lists/comments_list.dart';
import 'package:capstone_project_mobile/constants/route_constants.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/providers/post_provider.dart';
import 'package:capstone_project_mobile/shared/error_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class PostDetailScreen extends StatefulWidget {
  final String postId;
  const PostDetailScreen({super.key, required this.postId});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool loading = false;
  dynamic errorResponse;

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<PostProvider>(context, listen: false)
          .getOnePost(widget.postId)
          .catchError(
        (err) {
          errorResponse = err;
        },
      ).whenComplete(
        () => setState(() {
          loading = false;
        }),
      );
    });
    // futurePost = GetService.fetchOnePost(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Detailed Post',
      ),
      body: Consumer<PostProvider>(
        builder: (ctx, post, child) {
          if (loading) {
            return const LoadingScreen();
          }
          if (errorResponse != null) {
            return ErrorScreen(
              onTryAgain: () async {
                await post.getOnePost(widget.postId);
              },
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await post.getOnePost(widget.postId);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Post Card
                  PostCard(
                    post: post.getOneFuturePost,
                    isCurrentPost: post.getOneFuturePost.id == widget.postId,
                  ),

                  // Comment List
                  CommentsList(
                    postId: widget.postId,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: buildCommentButton(context),
    );
  }
}

Widget buildCommentButton(BuildContext context) {
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
      iconData: LucideIcons.messageCircle,
      text: 'Write a comment',
    ),
  );
}
