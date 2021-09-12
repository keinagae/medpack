import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/constants/constants.dart';
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

  setupAuth() {
    provider = UserProvider(baseUrl: Constants.apiUrl);
    getttinguserData.value = true;
    provider.me().then((response) {
      if (response.success) {
        user.value = response.data ?? User();
      } else {
        isLoggedIn.value = false;
      }
    }).whenComplete(() {
      getttinguserData.value = false;
    });
  }
}
