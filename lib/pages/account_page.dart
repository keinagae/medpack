import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/constants/routes.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Account"),
      bottomNavigationBar: Row(
        children: [
          IconButton(onPressed: (){
            GetStorage().erase().then((value){
              Get.offNamed(AppRoutes.login);
            });

          }, icon: Icon(Icons.logout)),
          TextButton(onPressed: (){
            Get.offNamed(AppRoutes.addProduct);

          }, child:Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Text("Product")
            ],
          ))
        ],
      ),
    );
  }
}
