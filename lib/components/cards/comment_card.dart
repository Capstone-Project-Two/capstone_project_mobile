import 'package:capstone_project_mobile/components/cards/profile_picture_card.dart';
import 'package:capstone_project_mobile/core/controller/patient_comment_controller.dart';
import 'package:capstone_project_mobile/core/model/patient_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  final ParentCommentV2 comment;
  CommentCard({
    super.key,
    required this.comment,
  });
  final PatientCommentController patientCommentController =
      Get.put(PatientCommentController());

  @override
  Widget build(BuildContext context) {
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
          _buildProfileHeader(profileImg: comment.patient.profileImg),

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
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProfileHeader({required String profileImg}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side
        Row(
          children: [
            ProfilePictureCard(
              imgPath: profileImg,
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
