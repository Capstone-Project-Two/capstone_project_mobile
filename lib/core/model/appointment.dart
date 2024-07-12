import 'package:capstone_project_mobile/core/model/base_model.dart';
import 'package:capstone_project_mobile/core/model/patient.dart';
import 'package:capstone_project_mobile/core/model/therapist.dart';

class Appointment extends BaseModel {
  final String note;
  final String symptoms;
  final String scheduleDate;
  final String status;
  final Patient patient;
  final Therapist therapist;

  Appointment({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.note,
    required this.symptoms,
    required this.scheduleDate,
    required this.status,
    required this.patient,
    required this.therapist,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String id,
        'createdAt': String createdAt,
        'updatedAt': String updatedAt,
        'note': String note,
        'symptoms': String symtoms,
        'scheduleDate': String scheduleDate,
        'status': String status,
      } =>
        Appointment(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            note: note,
            symptoms: symtoms,
            scheduleDate: scheduleDate,
            status: status,
            patient: Patient.fromJson(json['patient']),
            therapist: Therapist.fromJson(json['therapist'])),
      _ => throw const FormatException('Failed to load appointment.'),
    };
  }
}
