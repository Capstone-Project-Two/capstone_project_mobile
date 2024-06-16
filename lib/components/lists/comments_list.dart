import 'package:capstone_project_mobile/model/patient_comment.dart';
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
  bool loading = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        loading = true;
      });

      await Provider.of<PatientCommentProvider>(context, listen: false)
          .getPatientCommentsByPost(widget.postId)
          .whenComplete(
            () => setState(() {
              loading = false;
            }),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientCommentProvider>(
      builder: ((context, comment, child) {
        if (loading) {
          return const LoadingScreen();
        }
        if (comment.getFuturePatientComments.isEmpty) {
          return const EmptyScreen(
            text: 'No comments',
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 8,
            ),
            itemCount: comment
                .getFuturePatientComments.length, // total number of items
            itemBuilder: (context, index) {
              PatientComment cmt = comment.getFuturePatientComments[index];
              return Row(
                children: [
                  Text(cmt.content),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("Reply count: ${cmt.replyCount.toString()}"),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
