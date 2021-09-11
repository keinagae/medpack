import 'package:get/get.dart';
import 'package:medpack/controllers/cart_controller.dart';
import 'package:medpack/data/modals/product.dart';

class ProductDetailController extends GetxController {
  var product = Product().obs;
  var quantityToAdd = 1.obs;
  @override
  void onInit() {
    super.onInit();
    product.value =
        (Get.arguments as Map<String, dynamic>)['medicine'] as Product;
  }

  set quantity(int amount) {
    quantityToAdd.value = amount;
  }

  int get quantity {
    return quantityToAdd.value;
  }

  void addQuantityToCart() {
    final cartController = Get.find<CartController>();
    cartController.addToCart(product: product.value, quantity: quantity);
    quantity = 1;
  }
}
