import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/pages/forum/create_post_screen.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:capstone_project_mobile/shared/empty_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _elevatedButton(context),
      body: FutureBuilder(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var posts = snapshot.data!;
            if (posts.isEmpty) {
              return const EmptyScreen();
            }

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(
                  post: posts[index],
                  isCurrentPost: false,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const LoadingScreen();
        },
      ),
    );
  }
}

ElevatedButton _elevatedButton(BuildContext context) {
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
