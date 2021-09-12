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
              child: Text(
                "Hi, ${auth.user.value.username}",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(child: ProfileContainer()),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          IconButton(
              onPressed: () {
                GetStorage().erase().then((value) {
                  Get.toNamed(AppRoutes.login);
                });
              },
              icon: Icon(Icons.logout)),
          TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.myProducts);
              },
              child: Text("Products")),
          TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addProduct);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.add), Text("Product")],
              )),
          TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.orders);
              },
              child: Text("Orders")),
        ],
      ),
    );
  }
}
