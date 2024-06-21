import 'package:capstone_project_mobile/model/patient_comment_model.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class PatientCommentProvider extends ChangeNotifier {
  List<ParentComment> _allPatientComments = [];

  List<ParentComment> get getAllPatientComments => _allPatientComments;
  void setAllPatientComments(List<ParentComment> newComments) {
    _allPatientComments = newComments;
    notifyListeners();
  }

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
    ).catchError((err) => throw err);

    setAllPatientComments(patientComments);
    return patientComments;
  }
}
