import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/core/controller/post_controller.dart';
import 'package:capstone_project_mobile/pages/forum/create_post_screen.dart';
import 'package:capstone_project_mobile/shared/error_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  bool loading = false;
  final PostController postController = Get.put(PostController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _elevatedButton(context),
      body: RefreshIndicator(
        onRefresh: () async {},
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

Widget _elevatedButton(BuildContext context) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  TextTheme textTheme = Theme.of(context).textTheme;

  return ElevatedButton.icon(
    style: const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(
        Colors.amber,
      ),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      ),
      alignment: Alignment.center,
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreatePostScreen(),
        ),
      );
    },
    icon: Icon(
      LucideIcons.plus,
      color: colorScheme.inversePrimary,
    ),
    label: Text(
      'Post',
      style: textTheme.displayMedium!.copyWith(
        color: colorScheme.inversePrimary,
      ),
    ),
  );
}
