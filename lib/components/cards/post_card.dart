import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/components/cards/profile_picture_card.dart';
import 'package:capstone_project_mobile/components/dialogs/error_dialog.dart';
import 'package:capstone_project_mobile/core/model/post.dart';
import 'package:capstone_project_mobile/pages/forum/post_detail_screen.dart';
import 'package:capstone_project_mobile/core/providers/post_provider.dart';
import 'package:capstone_project_mobile/core/services/post_service.dart';
import 'package:capstone_project_mobile/utils/image_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final bool isCurrentPost;
  const PostCard({super.key, required this.post, required this.isCurrentPost});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final String imgPath = 'lib/assets/images/image 80.png';

  bool loading = false;

  Future handleLikePost() async {
    setState(() {
      loading = true;
    });
    var res = await PostService.likePost(
      id: widget.post.id,
      patientId: '72706f6e670123456789abcd',
    ).catchError((err) {
      showDialog(
        context: context,
        builder: (context) => const ErrorDialog(text: "Something went wrong"),
      );
    }).whenComplete(
      () => setState(() {
        loading = false;
        Provider.of<PostProvider>(context, listen: false).getAllPosts();
      }),
    );

    return res;
  }

  @override
  Widget build(BuildContext context) {
    ImageHelper imageReqHelper = ImageHelper(imagePath: 'postPhotos');
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        if (!widget.isCurrentPost) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => PostDetailScreen(postId: widget.post.id),
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
                    ProfilePictureCard(imgPath: imgPath),

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
                            widget.post.patient.username,
                            style: textTheme.displayLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // Post time
                        Text(
                          DateFormat.MMMd().add_jm().format(
                              DateTime.parse(widget.post.createdAt).toLocal()),
                          style: textTheme.bodyLarge,
                        ),
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
                    widget.post.body,
                    style: textTheme.bodyLarge,
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  Column(
                    children: [
                      for (int i = 0; i < widget.post.postPhotos.length; i++)
                        Image.network(
                          imageReqHelper.getImage(
                              filename: widget.post.postPhotos[i].filename),
                        )
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  // buttons
                  Row(
                    children: [
                      // Like button
                      MyTextButton(
                        text: '${widget.post.likeCount} Like',
                        iconData: LucideIcons.heart,
                        onTap: () async {
                          if (!loading) {
                            await handleLikePost();
                          }
                        },
                        loading: loading,
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
