import 'package:capstone_project_mobile/core/model/patient_comment_model.dart';
import 'package:capstone_project_mobile/core/services/get_service.dart';
import 'package:get/get.dart';

class PatientCommentController extends GetxController {
  List<dynamic> _allComments = [];

  List<dynamic> get getAllComments => _allComments;
  void setAllComments(List<dynamic> newComments) {
    _allComments = newComments;
    update();
  }

  List<ParentComment> _allPatientComments = [];

  List<ParentComment> get getAllPatientComments => _allPatientComments;
  void setAllPatientComments(List<ParentComment> newComments) {
    _allPatientComments = newComments;
    update();
  }

  // List<ParentComment> _allChildComments = [];
  // List<ParentComment> get getAllChildComments => _allChildComments;
  // void setAllChildComments(List<ParentComment> newComments) {
  //   _allChildComments = newComments;
  //   update();
  // }

  bool _loading = false;

  bool get getLoading => _loading;
  void setLoading(bool loading) {
    _loading = loading;
    update();
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
    List allComments = [];

    List<ParentComment> parentComments = await GetService.fetchCommentByPost(
      postId: postId,
      parentId: parentId,
    ).catchError(
      (err) => throw err,
    );

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

      setAllComments(allComments);
    } else {
      for (ParentComment cmt in _allComments) {
        allComments.add(cmt);
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
