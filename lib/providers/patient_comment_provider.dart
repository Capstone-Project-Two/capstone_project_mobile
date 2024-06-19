import 'package:capstone_project_mobile/model/patient_comment_model.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class PatientCommentProvider extends ChangeNotifier {
  List<PatientComment> _allPatientComments = [];

  List<PatientComment> get getAllPatientComments => _allPatientComments;
  void setAllPatientComments(List<PatientComment> newComments) {
    _allPatientComments = newComments;
    notifyListeners();
  }

  bool _loading = false;

  bool get getLoading => _loading;
  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future getPatientCommentsByPost(String postId) async {
    List<PatientComment> patientComments =
        await GetService.fetchCommentByPost(postId)
            .catchError((err) => throw err);

    setAllPatientComments(patientComments);
    return patientComments;
  }
}
