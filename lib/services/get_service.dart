import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/model/patient.dart';
import 'package:capstone_project_mobile/services/http_service.dart';

Future<List<Patient>> fetchPatients() async {
  List<Patient> patients = [];
  var HttpResponse(:jsonData, :httpRes) =
      await httpGet(path: ApiRoute.patients.name);

  if (httpRes.statusCode == 200) {
    for (var eachPatient in jsonData['data']) {
      patients.add(Patient.fromJson(eachPatient));
    }
  } else {
    throw jsonData;
  }

  return patients;
}
