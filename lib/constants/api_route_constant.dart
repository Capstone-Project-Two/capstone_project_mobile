enum ApiRoute {
  auth("auth"),
  patients("patients"),
  therapists("therapists"),
  appointments("appointments"),
  posts("posts"),
  likePosts("like-posts"),
  patientComments("patient-comments");

  final String name;

  const ApiRoute(this.name);

  static ApiRoute? fromString(String route) {
    for (final entry in ApiRoute.values) {
      if (entry.name == route) {
        return entry;
      }
    }
    return null;
  }
}
