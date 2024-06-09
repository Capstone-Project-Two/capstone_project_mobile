import 'package:capstone_project_mobile/components/cards/post_card.dart';
import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/pages/forum/create_post_screen.dart';
import 'package:capstone_project_mobile/providers/post_provider.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
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
  // late Future<List<Post>> futurePosts;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PostProvider>(context).futurePosts = fetchPosts();
  }

  // Future handleRefresh() async {
  //   setState(() {
  //     futurePosts = fetchPosts();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _elevatedButton(context),
      body: Consumer<PostProvider>(
        builder: (context, post, child) {
          return RefreshIndicator(
            onRefresh: post.handleRefresh,
            child: FutureBuilder(
              future: post.futurePosts,
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
                }

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.error == null && snapshot.data == null) {
                  return const EmptyScreen();
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
