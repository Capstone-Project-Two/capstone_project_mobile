import 'package:capstone_project_mobile/components/cards/comment_card.dart';
import 'package:capstone_project_mobile/providers/patient_comment_provider.dart';
import 'package:capstone_project_mobile/shared/empty_screen.dart';
import 'package:capstone_project_mobile/shared/error_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CommentsList extends StatefulWidget {
  final String postId;
  final String? parentId;
  const CommentsList({
    super.key,
    required this.postId,
    this.parentId,
  });

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PatientCommentProvider>(
      builder: ((context, patientCommentProvider, child) {
        // return MaterialButton(
        //   onPressed: () async {
        //     await patientCommentProvider
        //         .handleGetAllPatientComments(widget.postId);
        //   },
        //   child: const Text('Try again'),
        // );
        return FutureBuilder(
          future: patientCommentProvider.handleGetAllPatientComments(
            postId: widget.postId,
            parentId: widget.parentId,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var comments = snapshot.data!;
              if (comments.length == 0) {
                return const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: EmptyScreen(
                    text: 'Be the first one to comment',
                  ),
                );
              }
              return Column(
                children: List.generate(
                  comments.length,
                  (index) {
                    return CommentCard(
                      comment: comments[index],
                    );
                  },
                ),
              );
            }
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: ErrorScreen(
                  onTryAgain: () async {
                    await patientCommentProvider.handleGetAllPatientComments(
                      postId: widget.postId,
                      parentId: widget.parentId,
                    );
                  },
                  errorObject: snapshot.error,
                ),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(25),
              child: LoadingScreen(),
            );
          },
        );
      }),
    );
  }
}
