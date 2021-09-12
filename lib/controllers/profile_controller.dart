import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/auth_model.dart';
import 'package:medpack/data/providers/user.dart';
import 'package:medpack/services/auth_service.dart';

class ProfileController extends GetxController {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  var errors = {}.obs;
  UserProvider provider = UserProvider(baseUrl: Constants.apiUrl);
  Rx<bool> saving = false.obs;
  Rx<bool> hasErrors = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final user = AuthService.service().user.value;
    nameController.text = user.name ?? "";
    addressController.text = user.profile.address ?? "";
    phoneController.text = user.profile.phone ?? "";
    provider = UserProvider(baseUrl: Constants.apiUrl);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    addressController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  void save() {
    if (form.currentState!.validate()) {
      // form.currentState!.save();
      final data = {
        "name": nameController.text,
        "address": addressController.text,
        "phone": phoneController.text
      };
      saving.value = true;
      hasErrors.value = false;
      provider.saveProfile(data).then((value) {
        if (value.success) {
          saving.value = false;
          hasErrors.value = false;
          AuthService.service().updateUser(value.data ?? User());
        } else {
          saving.value = false;
          hasErrors.value = true;
        }
      });
    }
  }
}
