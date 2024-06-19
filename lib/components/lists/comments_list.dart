import 'package:capstone_project_mobile/components/cards/comment_card.dart';
import 'package:capstone_project_mobile/model/patient_comment_model.dart';
import 'package:capstone_project_mobile/providers/patient_comment_provider.dart';
import 'package:capstone_project_mobile/shared/empty_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CommentsList extends StatefulWidget {
  final String postId;
  const CommentsList({
    super.key,
    required this.postId,
  });

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<PatientCommentProvider>(context, listen: false)
          .getPatientCommentsByPost(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientCommentProvider>(
      builder: ((context, patientCommentProvider, child) {
        if (patientCommentProvider.getLoading) {
          return const LoadingScreen();
        }
        if (patientCommentProvider.getFuturePatientComments.isEmpty) {
          return const EmptyScreen(
            text: 'No comments',
          );
        }
        return Column(
          children: List.generate(
            patientCommentProvider.getFuturePatientComments.length,
            (index) {
              PatientComment patientComment =
                  patientCommentProvider.getFuturePatientComments[index];
              return CommentCard(
                patientComment: patientComment,
              );
            },
          ),
        );
      }),
    );
  }
}
