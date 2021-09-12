import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/controllers/cart_controller.dart';
import 'package:medpack/data/providers/auth.dart';
import 'package:medpack/services/auth_service.dart';
import 'package:medpack/utils/errors.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late AuthProvider provider;
  var errors = {}.obs;
  Rx<bool> loggining = false.obs;
  Rx<bool> hasErrors = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    provider = AuthProvider(baseUrl: Constants.apiUrl);
    Future.delayed(Duration.zero, () {
      final box = GetStorage();
      print(box.getKeys());
      if (box.read("token") != null) {
        Get.offNamed(AppRoutes.account);
      }
    });
  }

  void login() {
    if (form.currentState!.validate()) {
      loggining.value = true;
      hasErrors.value = false;
      provider
          .login(
              username: emailController.text, password: passwordController.text)
          .then((value) {
        CartController.currentCart().fetchCart();
        AuthService.service().login().then((value) {
          loggining.value = false;
          hasErrors.value = false;
          if (value) {
            Get.offNamed(AppRoutes.account);
          } else {
            Get.snackbar("Unable to login", "Something went wrong");
          }
        });
      }).catchError((exception) {
        loggining.value = false;
        hasErrors.value = true;
        final error = exception as DioError;
        print(exception);
        if (error.response != null && error.response!.statusCode == 400) {
          errors.clear();
          errors.assignAll(
              parseErrors(error.response!.data as Map<String, dynamic>));
          print(errors);
        }
      });
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
