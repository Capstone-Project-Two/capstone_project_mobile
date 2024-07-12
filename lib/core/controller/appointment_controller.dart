import 'package:capstone_project_mobile/core/model/appointment.dart';
import 'package:capstone_project_mobile/core/services/get_service.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  List<Appointment> _allAppointments = [];

  void setAllAppointments(List<Appointment> newAppointments) {
    _allAppointments = newAppointments;
    update();
  }

  List<Appointment> get getAllAppointments => _allAppointments;

  Future<List<Appointment>> handleGetAllAppointments() async {
    List<Appointment> appointments = await GetService.fetchAppointments()
        .then((value) => value)
        .catchError((err) => throw err);

    setAllAppointments(appointments);

    return _allAppointments;
  }
}
