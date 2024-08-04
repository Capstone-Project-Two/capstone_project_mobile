// ignore_for_file: avoid_print

import 'package:capstone_project_mobile/core/services/login_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var isLoading = false.obs;
  var userToken = ''.obs;

  // final LoginService loginService;

  void register(String email, String password) async {
    isLoading(true);

    try {

      final response = await LoginService.register(email, password);
      userToken.value = response['token'];
      isLoggedIn(true);
    } catch (e) {
      Get.snackbar('Error', 'Failed to register');
    } finally {
      isLoading(false);
    }
  }

  void login(String email, String password) async {
    isLoading(true);

    try {
      print('in the login controller');
      print(email);
      print(password);

      final response = await LoginService.login(email, password);
      print(response);
      userToken.value = response['token'];
      isLoggedIn(true);
    } catch (e) {
      Get.snackbar('Error', 'Failed to login');
    } finally {
      isLoading(false);
    }
  }

  void logout() {
    userToken('');
    isLoggedIn(false);
  }
}
