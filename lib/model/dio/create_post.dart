class CreatePost {
  final String body;
  final String patient;

  CreatePost({
    required this.body,
    required this.patient,
  });

  String get getBody => body;
  String get getPatient => patient;
}
