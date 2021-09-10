import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/cart.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/data/providers/cart.dart';

class CartController extends GetxController {
  var cart = Cart().obs;
  var cartQuantity = 0.obs;
  CartProvider provider = CartProvider(baseUrl: Constants.apiUrl);

  @override
  void onInit() {
    super.onInit();
    provider.cart().then((response) {
      if (response.success) {
        if (response.data != null) {
          cart.value = response.data ?? cart.value;
          cart.value.items.forEach((element) {
            cartQuantity += element.quantity ?? 0;
          });
        }
      }
    });
  }

  void addToCart({required Product product, required int quantity}) {
    int index = cart.value.items
        .indexWhere((element) => element.product?.id == product.id);
    if (index != -1) {
      cart.value.items[index].quantity =
          cart.value.items[index].quantity! + quantity;
    } else {
      cart.value.items.add(CartItem(quantity: quantity, product: product));
    }
    cartQuantity.value = 0;
    cart.value.items.forEach((element) {
      cartQuantity.value += element.quantity ?? 0;
    });
    cart.refresh();
  }
}
