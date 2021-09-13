import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/services/auth_service.dart';
import 'package:medpack/widgets/buttons.dart';

class LoginRequiredWidget extends StatelessWidget {
  final Widget child;
  final IconData icon;
  final bool notify;
  final bool checkProfile;

  LoginRequiredWidget(
      {Key? key,
      required this.child,
      this.icon = Entypo.login,
      this.notify = false,
      this.checkProfile = true})
      : super(key: key);

  final AuthService auth = AuthService.service();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (auth.isLoggedIn.value) {
        if (!checkProfile) {
          return child;
        }
        if (auth.user.value.profile.isCompleted) {
          return child;
        }
        return RectIconButton(
          icon: icon,
          onPressed: () {
            if (notify) {
              Get.snackbar(
                  "Profile Incomplete", "Please Complete your profile");
              return;
            }
            Get.toNamed(AppRoutes.login);
          },
        );
      } else {
        return RectIconButton(
          icon: icon,
          onPressed: () {
            if (notify) {
              Get.snackbar("Login Required",
                  "You need to login first and setup profile");
              return;
            }
            Get.toNamed(AppRoutes.login);
          },
        );
      }
    });
  }
}
