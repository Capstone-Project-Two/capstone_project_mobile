import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/model/patient_comment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CommentCard extends StatelessWidget {
  final PatientComment patientComment;
  const CommentCard({
    super.key,
    required this.patientComment,
  });

  @override
  Widget build(BuildContext context) {
    const profile =
        'https://raw.githubusercontent.com/Capstone-Project-Two/assets/main/profiles-pics/profile_nine.png';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      profile,
                      width: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(patientComment.patient.username),
                      Text(
                        DateFormat.MMMd().add_jm().format(
                            DateTime.parse(patientComment.createdAt).toLocal()),
                      ),
                    ],
                  )
                ],
              ),

              // Right side
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),

          const SizedBox(
            height: 16,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(patientComment.content),
              const SizedBox(
                height: 16,
              ),
              MyTextButton(
                text: patientComment.replyCount.toString(),
                iconData: LucideIcons.messageCircle,
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
