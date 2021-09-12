import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/order.dart';
import 'package:medpack/data/providers/order.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  OrderProvider provider = OrderProvider(baseUrl: Constants.apiUrl);
  Rx<bool> loading = false.obs;
  Rx<bool> hasErrors = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchOrders();
  }

  Future<dynamic> fetchOrders() {
    loading.value = true;
    hasErrors.value = false;
    return provider.getOrders().then((response) {
      if (response.success) {
        orders.value = response.data ?? [];
        loading.value = false;
        hasErrors.value = false;
      } else {
        loading.value = false;
        hasErrors.value = true;
      }
    });
  }
}
