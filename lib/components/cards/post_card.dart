import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/components/cards/profile_picture_card.dart';
import 'package:capstone_project_mobile/constants/route_constants.dart';
import 'package:capstone_project_mobile/model/error_response_model.dart';
import 'package:capstone_project_mobile/model/post_model.dart';
import 'package:capstone_project_mobile/pages/forum/post_detail_screen.dart';
import 'package:capstone_project_mobile/providers/post_provider.dart';
import 'package:capstone_project_mobile/utils/image_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../dialogs/error_dialog.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final bool isCurrentPost;
  const PostCard({super.key, required this.post, required this.isCurrentPost});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final String imgPath =
      'https://raw.githubusercontent.com/Capstone-Project-Two/assets/main/profiles-pics/profile_nine.png';

  @override
  Widget build(BuildContext context) {
    ImageHelper imageReqHelper = ImageHelper(imagePath: 'postPhotos');
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<PostProvider>(builder: (ctx, postProvider, child) {
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
                                DateTime.parse(widget.post.createdAt)
                                    .toLocal()),
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
                        FutureBuilder(
                            future:
                                postProvider.handleGetLikeCount(widget.post.id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var likeCount = snapshot.data!;
                                return LikeButton(
                                  likeCount: likeCount.toString(),
                                  postId: widget.post.id,
                                );
                              }
                              if (snapshot.hasError) {
                                return LikeButton(
                                  likeCount: '-1',
                                  postId: widget.post.id,
                                );
                              }
                              return LikeButton(
                                likeCount: '...',
                                postId: widget.post.id,
                              );
                            }),
                        const SizedBox(
                          width: 8,
                        ),
                        // Comment button
                        MyTextButton(
                          text: '${widget.post.commentCount} Comment',
                          icon: Icon(
                            LucideIcons.messageCircle,
                            color: colorScheme.tertiary,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteConstant.commentPage.name,
                            );
                          },
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
    });
  }
}

class LikeButton extends StatelessWidget {
  final String likeCount;
  final String postId;
  const LikeButton({
    super.key,
    required this.likeCount,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    final PostProvider postProvider = context.read<PostProvider>();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MyTextButton(
      text: '${likeCount.toString()} Likes',
      icon: Icon(
        LucideIcons.heart,
        color: colorScheme.tertiary,
      ),
      onTap: () async {
        await postProvider.handleLikePost(postId).catchError((err) {
          ErrorResponse errorResponse = ErrorResponse.fromJson(err);
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(
              text: errorResponse.statusCode.toString(),
            ),
          );
        });
      },
    );
  }
}
