class CreateAppointment {
  final String note;
  final String symptoms;
  final String patient;
  final String therapist;
  final String scheduleDate;

  CreateAppointment({
    required this.note,
    required this.symptoms,
    required this.therapist,
    required this.patient,
    required this.scheduleDate,
  });

  String get getNote => note;
  String get getSymtoms => symptoms;
  String get getPatient => patient;
  String get getTherapist => therapist;
  String get getScheduleDate => scheduleDate;
}
