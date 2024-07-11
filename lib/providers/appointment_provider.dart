import 'package:capstone_project_mobile/model/appointment.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  List<Appointment> _allAppointments = [];

  List<Appointment> get getAllAppointments => _allAppointments;

  void setAllAppointments(List<Appointment> newAppointments) {
    _allAppointments = newAppointments;
    notifyListeners();
  }

  Future<List<Appointment>> handleGetAllAppointments() async {
    List<Appointment> appointments = await GetService.fetchAppointments()
        .then((value) => value)
        .catchError((err) => throw err);

    setAllAppointments(appointments);
    return _allAppointments;
  }
}
