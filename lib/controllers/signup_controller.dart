import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/providers/auth.dart';
import 'package:medpack/utils/errors.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late AuthProvider provider;
  Map<String, String> errors = {};
  Rx<bool> saving = false.obs;
  Rx<bool> hasErrors = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    provider = AuthProvider(baseUrl: Constants.apiUrl);
  }

  void signup(Function toLogin) {
    if (form.currentState!.validate()) {
      saving.value = true;
      hasErrors.value = false;
      provider
          .signup(
              username: emailController.text, password: passwordController.text)
          .then((value) {
        toLogin();
        Get.snackbar("Signed Up", "Please Login");
        saving.value = false;
        hasErrors.value = false;
      }).catchError((exception) {
        print(exception);
        final error = exception as DioError;
        print(exception);
        if (error.response != null && error.response!.statusCode == 400) {
          errors.clear();
          errors.addAll(parseErrors(error.response!.data));
          print(errors);
        }
        saving.value = false;
        hasErrors.value = true;
      });
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }
}
