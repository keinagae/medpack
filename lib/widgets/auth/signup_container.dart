import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpack/controllers/signup_controller.dart';

class SignupContainer extends StatelessWidget {
  SignupContainer({Key? key}) : super(key: key);

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Form(
        key: controller.form,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Signup",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    validator: (value) {
                      print(value);
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: Color(0xfff7f7f7),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Color(0xfff7f7f7),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.rePasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Re Type Password",
                        filled: true,
                        fillColor: Color(0xfff7f7f7),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Re password can't be empty";
                      } else {
                        if (controller.passwordController.text !=
                            controller.rePasswordController.text) {
                          return "Re password must match password";
                        }
                      }
                      return null;
                    },
                  ),
                ],
              ),
            )),
            SizedBox(
              width: double.infinity,
              child: Obx(() => ElevatedButton(
                    onPressed: controller.saving.value
                        ? null
                        : () {
                            controller.signup();
                          },
                    child: controller.saving.value
                        ? Text("Saving...")
                        : Text("Signup"),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
