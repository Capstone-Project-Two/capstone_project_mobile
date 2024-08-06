enum ApiRoute {
  auth("auth"),
  patients("patients"),
  therapists("therapists"),
  appointments("appointments"),
  posts("posts"),
  likePosts("like-posts"),
  patientComments("patient-comments"),
  newPatientComments("patient-comments/comments-new"),
  creditPackages("credits"),
  stripe("stripe"),
  stressMonitor("stress-monitor");

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
