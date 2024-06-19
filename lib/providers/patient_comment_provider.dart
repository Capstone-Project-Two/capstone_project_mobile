import 'package:capstone_project_mobile/model/patient_comment_model.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class PatientCommentProvider extends ChangeNotifier {
  bool _loading = false;

  List<PatientComment> _futurePatientComments = [];

  List<PatientComment> get getFuturePatientComments => _futurePatientComments;
  bool get getLoading => _loading;

  Future getPatientCommentsByPost(String postId) async {
    _loading = true;
    notifyListeners();
    _futurePatientComments =
        await GetService.fetchCommentByPost(postId).whenComplete(() {
      _loading = false;
      notifyListeners();
    });
  }
}
