import 'package:get/get.dart';
import 'package:medpack/data/modals/cart.dart';
import 'package:medpack/data/providers/cart.dart';

class CartController extends GetxController {
  var cart = Cart().obs;
  CartProvider provider = CartProvider();

  @override
  void onInit() {
    super.onInit();
  }
}
