import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/components/lists/comments_list.dart';
import 'package:capstone_project_mobile/constants/route_constants.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
      body: Column(children: [
        SingleChildScrollView(
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: CommentsList(
              postId: widget.postId,
            ),
          ),
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: MyTextButton(
            onTap: () {
              Navigator.pushNamed(context, RouteConstant.commentPage.name);
            },
            iconData: LucideIcons.messageCircle,
            text: 'Write a comment',
          ),
        )
      ]),
    );
  }
}
