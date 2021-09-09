import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/providers/auth.dart';
import 'package:medpack/utils/errors.dart';

class SignupController extends GetxController{
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController rePasswordController=TextEditingController();
  final GlobalKey<FormState> form=GlobalKey<FormState>();
  late AuthProvider provider;
  Map<String,String> errors={};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    provider =AuthProvider(baseUrl: Constants.apiUrl);
  }

  void signup(){
    if(form.currentState!.validate()){
      provider.signup(username: emailController.text, password: passwordController.text).then((value){
        print(value.data);
      }).catchError((exception){
        print(exception);
        final error=exception as DioError;
        print(exception);
        if(error.response!=null&&error.response!.statusCode==400){
          errors.clear();
          errors.addAll(parseErrors(error.response!.data));
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
    rePasswordController.dispose();
  }
}