import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medpack/controllers/add_product_controller.dart';
import 'package:medpack/widgets/appbars.dart';
import 'package:medpack/widgets/buttons.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({Key? key}) : super(key: key);
  final AddProductController controller = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NestedAppWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, bottom: 30),
                child: Text(
                  "Add Medicine",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Form(
                  key: controller.form,
                  child: Column(
                    children: [
                      Obx(() => TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter medicine name";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.date['name'] = value;
                            },
                            controller: controller.nameController,
                            decoration: InputDecoration(
                                labelText: "Name *",
                                errorText: controller.errors['name'],
                                filled: true,
                                fillColor: Color(0xfff7f7f7),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20))),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() => TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter medicine description";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.date['description'] = value;
                            },
                            controller: controller.descriptionController,
                            minLines: 5,
                            maxLines: 7,
                            decoration: InputDecoration(
                                labelText: "Description *",
                                errorText: controller.errors['description'],
                                filled: true,
                                fillColor: Color(0xfff7f7f7),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20))),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() => TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter expiry date";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.date['expiry_date'] = value;
                            },
                            readOnly: true,
                            controller: controller.expiryDateController,
                            decoration: InputDecoration(
                                labelText: "Expiry Date *",
                                errorText: controller.errors['expiry_date'],
                                filled: true,
                                fillColor: Color(0xfff7f7f7),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                suffixIcon: TextButton(
                                  onPressed: () async {
                                    final date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2050));
                                    if (date != null) {
                                      controller.expiryDateController.text =
                                          DateFormat("yyyy-MM-dd").format(date);
                                    }
                                  },
                                  child: Icon(Entypo.calendar),
                                )),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() => TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please add image";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.date['image'] =
                                  controller.imageFile!.path;
                            },
                            readOnly: true,
                            controller: controller.imageController,
                            decoration: InputDecoration(
                                labelText: "Image *",
                                errorText: controller.errors['image'],
                                filled: true,
                                fillColor: Color(0xfff7f7f7),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // if (controller.imageFile != null)
                                    RectIconButton(
                                      onPressed: () {
                                        controller.imageFile = null;
                                        controller.imageController.text = "";
                                      },
                                      icon: Entypo.cancel,
                                    ),
                                    RectIconButton(
                                      onPressed: () async {
                                        final ImagePicker _picker =
                                            ImagePicker();
                                        controller.imageFile =
                                            await _picker.pickImage(
                                                source: ImageSource.gallery);
                                        if (controller.imageFile == null) {
                                          controller.imageController.text = "";
                                          return;
                                        } else {
                                          final filename = controller
                                              .imageFile!.path
                                              .split("/")
                                              .last;
                                          controller.imageController.text =
                                              filename;
                                        }
                                      },
                                      icon: Entypo.picture,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                )),
                          )),
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.save();
                  },
                  child: Text("Add Product"),
                  style: ButtonStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
