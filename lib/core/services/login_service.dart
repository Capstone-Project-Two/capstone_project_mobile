import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/core/services/http_service.dart';
import 'package:capstone_project_mobile/utils/api_helper.dart';

class LoginService {


  static Future register(String email, String password) async {
        HttpService httpService = HttpService(path: '${ApiRoute.auth.name}/register');

    var HttpResponse(:httpRes, :jsonData) = await httpService.httpPost(
      body: {'email': email, 'password': password},
    );

    if (ApiHelper.isOk(httpRes.statusCode)) {
      return httpRes;
    } else {
      throw jsonData;
    }
  }

  static Future login(String email, String password) async {
    HttpService httpService = HttpService(path: '${ApiRoute.auth.name}/patient/login');

    var HttpResponse(:httpRes, :jsonData) = await httpService.httpPost(
      body: {'email': email, 'password': password},
    );

    if (ApiHelper.isOk(httpRes.statusCode)) {
      return jsonData['data'];
    } else {
      throw jsonData;
    }
  }

  Future<void> logout() async {
    // Implement logout logic if needed (e.g., token invalidation)
  }
}
