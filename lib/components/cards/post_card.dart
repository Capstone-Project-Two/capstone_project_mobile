import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/pages/posts/post_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final bool isCurrentPost;
  const PostCard({super.key, required this.post, required this.isCurrentPost});
  final String imgPath = 'lib/assets/images/image 80.png';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        if (!isCurrentPost) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => PostDetailScreen(postId: post.id),
            ),
          ).then((value) => Navigator.maybePop(context));
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Column(
          children: [
            // header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // profile
                Row(
                  children: [
                    // profile
                    profilePicture(imgPath: imgPath),

                    const SizedBox(
                      width: 12,
                    ),

                    // name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        SizedBox(
                          width: 150,
                          child: Text(
                            post.patient.username,
                            style: textTheme.displayLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // Post time
                        Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(post.createdAt)),
                          style: textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ],
                ),

                // more
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),

            // body
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 24, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // body text
                  Text(
                    post.body,
                    style: textTheme.bodyLarge,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  // buttons
                  Row(
                    children: [
                      // Like button
                      MyTextButton(
                        text: 'Like',
                        iconData: LucideIcons.heart,
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      // Comment button
                      MyTextButton(
                        text: 'Comment',
                        iconData: LucideIcons.messageCircle,
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

ClipRRect profilePicture({required String imgPath}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(25),
    child: Image.asset(
      imgPath,
      width: 50,
      height: 50,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
    ),
  );
}
