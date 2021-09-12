import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpack/controllers/login_controller.dart';

class LoginContainer extends StatelessWidget {
  LoginContainer({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());

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
                "Login",
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
                  Obx(() => TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        controller: controller.emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            errorText: controller.errors['non_field_errors'],
                            filled: true,
                            fillColor: Color(0xfff7f7f7),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20))),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Color(0xfff7f7f7),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            )),
            SizedBox(
              width: double.infinity,
              child: Obx(() => ElevatedButton(
                    onPressed: controller.loggining.value
                        ? null
                        : () {
                            controller.login();
                          },
                    child: controller.loggining.value
                        ? Text("Loggingin...")
                        : Text("Login"),
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
