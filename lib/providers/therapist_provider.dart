import 'package:capstone_project_mobile/model/therapist.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class TherapistProvider extends ChangeNotifier {
  List<Therapist> _allTherapists = [];

  List<Therapist> get getAllTherapists => _allTherapists;

  void setAllTherapists(List<Therapist> newTherapists) {
    _allTherapists = newTherapists;
    notifyListeners();
  }

  Future<List<Therapist>> handleGetAllTherapists() async {
    List<Therapist> therapists = await GetService.fetchTherapists()
        .then((value) => value)
        .catchError((err) => throw err);

    setAllTherapists(therapists);
    return _allTherapists;
  }
}
