
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/constants/routes.dart';

class LoginRequiredMiddleWare extends GetMiddleware{
  @override
  @override
  RouteSettings? redirect(String? route){
    final box = GetStorage();
    print(box.getKeys());
    if (box.read("token") != null) {
      return null;
    }
    return RouteSettings(
      name: AppRoutes.login
    );
  }
}