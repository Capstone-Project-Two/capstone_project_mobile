import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/pages/forum/create_post_screen.dart';
import 'package:capstone_project_mobile/providers/post_provider.dart';
import 'package:capstone_project_mobile/shared/empty_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        loading = true;
      });
      await Provider.of<PostProvider>(context, listen: false)
          .getAllPosts()
          .whenComplete(
            () => setState(() {
              loading = false;
            }),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _elevatedButton(context),
      body: Consumer<PostProvider>(
        builder: (context, post, child) {
          if (loading) {
            return const LoadingScreen();
          }
          return RefreshIndicator(
            onRefresh: post.getAllPosts,
            child: post.getPosts.isEmpty
                ? const EmptyScreen()
                : ListView.builder(
                    itemCount: post.getPosts.length,
                    itemBuilder: (ctx, index) {
                      return PostCard(
                        post: post.getPosts[index],
                        isCurrentPost: false,
                      );
                    },
                  ),
          );
        },
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
