class CreatePost {
  final String body;
  final String patient;
  final dynamic postPhotos;

  CreatePost({
    required this.body,
    required this.patient,
    required this.postPhotos,
  });

  String get getBody => body;
  String get getPatient => patient;
  String get getPostPhotos => postPhotos;
}