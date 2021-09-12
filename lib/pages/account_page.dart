import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/services/auth_service.dart';
import 'package:medpack/widgets/appbars.dart';
import 'package:medpack/widgets/profile/profile_container.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  final auth = AuthService.service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NestedAppWidget(),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Obx(() {
                  String name = "";
                  final user = auth.user.value;
                  if (user.name != null) {
                    name = user.name ?? "";
                  } else {
                    name = user.email ?? "";
                  }
                  return Text(
                    "Hi, ${name}",
                    style: Theme.of(context).textTheme.headline3,
                  );
                })),
            Expanded(child: ProfileContainer()),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.myProducts);
              },
              child: Text("My Medicines")),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.orders);
              },
              child: Text("Orders")),
          ElevatedButton(
              onPressed: () {
                AuthService.service().logout();
              },
              child: Text("Logout")),
        ],
      ),
    );
  }
}
