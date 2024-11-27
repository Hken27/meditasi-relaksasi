import 'package:get/get.dart';
import 'package:meditasi_app/view/screen/register_screen/login_screen.dart';
import 'package:meditasi_app/view/screen/register_screen/signUp_screen.dart';

class AuthController extends GetxController {
  // Untuk mengelola navigasi
  void goToLogin() {
    Get.to(() => LoginScreen());
  }

  void goToRegister() {
    Get.to(() => RegisterScreen());
  }
}
