import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/controllers/cart_controller.dart';
import 'package:medpack/data/modals/auth_model.dart';
import 'package:medpack/data/providers/user.dart';

class AuthService extends GetxService {
  Rx<bool> isLoggedIn = false.obs;
  UserProvider provider = UserProvider();
  Rx<User> user = User().obs;
  var getttinguserData = true.obs;

  static AuthService service() => Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    final box = GetStorage();
    if (box.read("token") != null) {
      isLoggedIn.value = true;
      setupAuth();
    }
  }

  Future<bool> login() {
    isLoggedIn.value = true;
    return setupAuth();
  }

  Future<bool> setupAuth() {
    provider = UserProvider(baseUrl: Constants.apiUrl);
    getttinguserData.value = true;
    return provider.me().then((response) {
      if (response.success) {
        user.value = response.data ?? User();
        return Future.value(true);
      } else {
        isLoggedIn.value = false;
        return Future.value(false);
      }
    }).whenComplete(() {
      getttinguserData.value = false;
    });
  }

  void logout() {
    isLoggedIn.value = false;
    user.value = User();
    CartController.currentCart().clearCart();
    GetStorage().erase().then((value) {
      Get.offAndToNamed(AppRoutes.home);
    });
  }

  void updateUser(User user) {
    this.user.value = user;
  }
}
