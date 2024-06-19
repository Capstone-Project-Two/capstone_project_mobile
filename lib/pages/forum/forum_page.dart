import 'package:capstone_project_mobile/components/buttons/floating_post_button.dart';
import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/providers/post_provider.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingPostButton(),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return RefreshIndicator(
            onRefresh: postProvider.handleGetAllPosts,
            child: FutureBuilder(
              future: postProvider.handleGetAllPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var posts = snapshot.data!;
                  return ListView.builder(
                    itemCount: postProvider.getAllPosts.length,
                    itemBuilder: (ctx, index) {
                      return PostCard(
                        post: posts[index],
                        isCurrentPost: false,
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const LoadingScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
