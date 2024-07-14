import 'package:capstone_project_mobile/core/model/appointment.dart';
import 'package:capstone_project_mobile/core/services/get_service.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  List<Appointment> _allAppointments = [];
  late Appointment _singleAppointment;

  void setAllAppointments(List<Appointment> newAppointments) {
    _allAppointments = newAppointments;
    update();
  }

  void setSingleAppointment(Appointment newAppointment) {
    _singleAppointment = newAppointment;
    update();
  }

  List<Appointment> get getAllAppointments => _allAppointments;
  Appointment get getSingleAppointment => _singleAppointment;

  Future<List<Appointment>> handleGetAllAppointments() async {
    List<Appointment> appointments = await GetService.fetchAppointments()
        .then((value) => value)
        .catchError((err) => throw err);

    setAllAppointments(appointments);

    return _allAppointments;
  }

  Future<Appointment> handleGetSingleAppointment(String appointmentId) async {
    Appointment appointment =
        await GetService.fetchOneAppointment(appointmentId)
            .then((value) => value)
            .catchError((err) => throw err);

    setSingleAppointment(appointment);

    return _singleAppointment;
  }
}
