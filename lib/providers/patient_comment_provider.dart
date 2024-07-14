import 'package:capstone_project_mobile/model/patient_comment_model.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class PatientCommentProvider extends ChangeNotifier {
  List<dynamic> _allComments = [];

  List<dynamic> get getAllComments => _allComments;
  void setAllComments(List<dynamic> newComments) {
    _allComments = newComments;
    notifyListeners();
  }

  List<ParentComment> _allPatientComments = [];

  List<ParentComment> get getAllPatientComments => _allPatientComments;
  void setAllPatientComments(List<ParentComment> newComments) {
    _allPatientComments = newComments;
    notifyListeners();
  }

  // List<ParentComment> _allChildComments = [];
  // List<ParentComment> get getAllChildComments => _allChildComments;
  // void setAllChildComments(List<ParentComment> newComments) {
  //   _allChildComments = newComments;
  //   notifyListeners();
  // }

  bool _loading = false;

  bool get getLoading => _loading;
  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future handleGetAllPatientComments({
    required String postId,
    String? parentId,
  }) async {
    List<ParentComment> patientComments = await GetService.fetchCommentByPost(
      postId: postId,
      parentId: parentId,
    ).catchError(
      (err) => throw err,
    );
    // if (parentId != null) {
    //   for (ParentComment cmt in _allPatientComments) {
    //     print(cmt.content);
    //   }
    // }

    // if (parentId != null) {
    //   setAllChildComments(patientComments);
    //   setAllPatientComments([..._allChildComments, ...patientComments]);
    // } else {
    // }
    setAllPatientComments(patientComments);
    // return _allComments;
    return patientComments;
  }

  // Render more comments
  Future<List> handleGetAllComments({
    required String postId,
    String? parentId,
  }) async {
    // Variable to hold existing comments from comment list
    List allComments = [];

    // Fetch parent comments
    List<ParentComment> parentComments = await GetService.fetchCommentByPost(
      postId: postId,
      parentId: parentId,
    ).catchError(
      (err) => throw err,
    );
    // If request to load more replies
    if (parentId == null) {
      // allComments.addAll(parentComments);
      for (ParentComment cmt in parentComments) {
        allComments.add(cmt);
        if (cmt.children!.isNotEmpty) {
          for (ChildComment childCmt in cmt.children!) {
            allComments.add(childCmt);
          }
        }
      }
      // Update comment list
      setAllComments(allComments);
    } else {
      // if Comment List is not empty
      for (ParentComment cmt in _allComments) {
        // Add existing comments from list
        allComments.add(cmt);
        // Find child comments from comment list then add it `allComments`
        for (ChildComment childCmt in cmt.children!) {
          // print(childCmt.content);
          allComments.add(childCmt);
          if (childCmt.replyCount > 0) {
            for (ParentComment cmt in parentComments) {
              if (cmt.parentComment == childCmt.id) {
                allComments.add(cmt);
              }
            }
          }
        }
      }
      // Update comment list
      setAllComments(allComments);
    }

    // if (parentId != null) {
    //   for (var cmt in allComments) {
    //     // print(cmt.content);
    //   }
    // }
    return _allComments;
  }
}
