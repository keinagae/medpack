import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/controllers/products_controller.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/data/providers/product.dart';
import 'package:medpack/constants/constants.dart';

class AddProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  Product? instance;

  Rx<bool> saving = false.obs;
  Rx<bool> hasErrors = false.obs;

  XFile? imageFile;
  var errors = {}.obs;
  var date = <String, dynamic>{}.obs;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  ProductProvider provider = ProductProvider(baseUrl: Constants.apiUrl);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      instance = (Get.arguments as Map<String, dynamic>)['product'] as Product;
      nameController.text = instance?.name ?? "";
      descriptionController.text = instance?.description ?? "";
      quantityController.text = instance?.quantity.toString() ?? "";
      expiryDateController.text = DateFormat("yyyy-MM-dd")
          .format(instance!.expiryDate ?? DateTime.now());
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    descriptionController.dispose();
    expiryDateController.dispose();
  }

  void updateProduct() {
    saving.value = true;
    hasErrors.value = false;
    provider.update(instance?.id ?? 0, date).then((value) {
      if (value.success) {
        Get.find<ProductsController>().updateProduct(value.data ?? Product());
        saving.value = false;
        Get.offNamed(AppRoutes.detail, arguments: {"medicine": value.data});
      } else if (value.hasError) {
        print(value.inputErrors);
        print(value.inputError);
        if (value.inputError) {
          errors.clear();
          errors.addAll(value.inputErrors);

          print(value.inputErrors);
        }
        saving.value = false;
        hasErrors.value = true;
      }
    });
  }

  void createProduct() {
    saving.value = true;
    hasErrors.value = false;
    provider.create(date).then((value) {
      if (value.success) {
        Get.find<ProductsController>().addProduct(value.data ?? Product());
        saving.value = false;
        Get.offNamed(AppRoutes.myProductsDetail,
            arguments: {"product": value.data});
      } else if (value.hasError) {
        if (value.inputError) {
          errors.clear();
          errors.addAll(value.inputErrors);
        }
        saving.value = false;
        hasErrors.value = true;
      }
    });
  }

  void save() {
    if (form.currentState!.validate()) {
      form.currentState!.save();
      if (instance == null) {
        createProduct();
      } else {
        updateProduct();
      }
    }
  }
}
