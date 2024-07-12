import 'package:capstone_project_mobile/core/model/therapist.dart';
import 'package:capstone_project_mobile/core/services/get_service.dart';
import 'package:get/get.dart';

class TherapistController extends GetxController {
  List<Therapist> _allTherapiss = [];

  void setAllTherapists(List<Therapist> newTherapists) {
    _allTherapiss = newTherapists;
    update();
  }

  List<Therapist> get getAllTherapists => _allTherapiss;

  Future<List<Therapist>> handleGetAllTherapists() async {
    List<Therapist> therapists = await GetService.fetchTherapists()
        .then((value) => value)
        .catchError((err) => throw err);

    setAllTherapists(therapists);

    return _allTherapiss;
  }
}
