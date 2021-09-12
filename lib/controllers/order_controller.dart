import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/order.dart';
import 'package:medpack/data/providers/order.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  OrderProvider provider = OrderProvider(baseUrl: Constants.apiUrl);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() {
    provider.getOrders().then((response) {
      if (response.success) {
        orders.value = response.data ?? [];
      }
    });
  }
}
