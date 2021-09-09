import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/data/providers/product.dart';
import 'package:medpack/constants/constants.dart';

class AddProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  XFile? imageFile;
  var errors = {}.obs;
  var date = <String, dynamic>{}.obs;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  ProductProvider provider = ProductProvider(baseUrl: Constants.apiUrl);

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    descriptionController.dispose();
    expiryDateController.dispose();
  }

  void save() {
    if (form.currentState!.validate()) {
      form.currentState!.save();
      provider.create(date).then((value) {
        Get.offNamed(AppRoutes.detail, arguments: {"medicine": value});
      }).catchError((exception) {
        var error = exception as DioError;
        print(error.response!.data);
      });
    }
  }
}
