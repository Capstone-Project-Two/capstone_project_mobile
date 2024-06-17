class ApiHelper {
  static bool isOk(int statusCode) {
    return statusCode >= 200 && statusCode <= 299;
  }
}
