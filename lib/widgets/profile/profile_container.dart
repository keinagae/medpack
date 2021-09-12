import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpack/controllers/profile_controller.dart';

class ProfileContainer extends StatelessWidget {
  ProfileContainer({Key? key}) : super(key: key);

  final ProfileController controller = Get.put(ProfileController());

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
                "Edit Profile",
                style: Theme.of(context).textTheme.headline4,
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
                    controller: controller.nameController,
                    validator: (value) {
                      print(value);
                      if (value == null || value.isEmpty) {
                        return "Name can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Name",
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
                    minLines: 3,
                    maxLines: 5,
                    controller: controller.addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Address can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Address",
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
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                    decoration: InputDecoration(
                        labelText: "Phone No.",
                        filled: true,
                        fillColor: Color(0xfff7f7f7),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone Can't be empty";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.save();
                },
                child: Text("Save"),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
