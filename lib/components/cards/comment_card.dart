import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/components/cards/profile_picture_card.dart';
import 'package:capstone_project_mobile/core/controller/patient_comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CommentCard extends StatelessWidget {
  final dynamic comment;
  CommentCard({
    super.key,
    required this.comment,
  });
  final PatientCommentController patientCommentController =
      Get.put(PatientCommentController());

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile header
          _buildProfileHeader(),

          const SizedBox(
            height: 16,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.content),
              const SizedBox(
                height: 16,
              ),
              if (comment.replyCount > 0)
                MyTextButton(
                  text: comment.replyCount.toString(),
                  icon: Icon(
                    LucideIcons.messageCircle,
                    color: colorScheme.tertiary,
                  ),
                  onTap: () async {
                    await patientCommentController.handleGetAllComments(
                      postId: comment.post,
                      parentId: comment.id,
                    );
                  },
                ),
              // if (comment.replyCount > 0 && comment.children[0] is! String)
              //   ...List.generate(
              //     comment.children!.length,
              //     (index) {
              //       return CommentCard(
              //         comment: comment.children![index],
              //       );
              //     },
              //   ),
              // if (patientCommentController.getAllChildComments.isNotEmpty &&
              //     patientCommentProvider
              //             .getAllChildComments[0].parentComment! ==
              //         comment.id)
              //   ...List.generate(
              //     patientCommentController.getAllChildComments.length,
              //     (index) {
              //       ParentComment cmt =
              //           patientCommentController.getAllChildComments[index];
              //       return CommentCard(comment: cmt);
              //     },
              //   ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    const profile =
        'https://raw.githubusercontent.com/Capstone-Project-Two/assets/main/profiles-pics/profile_nine.png';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side
        Row(
          children: [
            const ProfilePictureCard(
              imgPath: profile,
              size: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.patient.username),
                Text(
                  DateFormat.MMMd()
                      .add_jm()
                      .format(DateTime.parse(comment.createdAt).toLocal()),
                ),
              ],
            )
          ],
        ),

        // Right side
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}
