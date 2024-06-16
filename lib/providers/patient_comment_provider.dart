import 'package:capstone_project_mobile/model/patient_comment.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class PatientCommentProvider extends ChangeNotifier {
  List<PatientComment> _futurePatientComments = [];

  List<PatientComment> get getFuturePatientComments => _futurePatientComments;

  Future getPatientCommentsByPost(String postId) async {
    _futurePatientComments = await GetService.fetchCommentByPost(postId);
    notifyListeners();
  }
}
