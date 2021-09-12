import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/cart.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/data/providers/cart.dart';
import 'package:medpack/data/providers/order.dart';
import 'package:medpack/services/auth_service.dart';

class CartController extends GetxController {
  var cart = Cart().obs;
  var cartQuantity = 0.obs;

  var saving = false.obs;
  var hasErrors = false.obs;

  CartProvider provider = CartProvider(baseUrl: Constants.apiUrl);

  static CartController currentCart() => Get.find<CartController>();

  @override
  void onInit() {
    super.onInit();
    if (AuthService.service().isLoggedIn.value) {
      fetchCart();
    }
  }

  void fetchCart() {
    provider.cart().then((response) {
      if (response.success) {
        if (response.data != null) {
          cartQuantity.value = 0;
          cart.value = response.data ?? cart.value;
          cart.value.items.forEach((element) {
            cartQuantity.value += element.quantity ?? 0;
          });
        }
      }
    });
  }

  void clearCart() {
    cart.value = Cart();
  }

  void updateCartQuantity() {
    cartQuantity.value = 0;
    cart.value.items.forEach((element) {
      cartQuantity.value += element.quantity ?? 0;
    });
  }

  void addToCart({required Product product, required int quantity}) {
    int index = cart.value.items
        .indexWhere((element) => element.product?.id == product.id);
    if (index != -1) {
      cart.value.items[index].quantity =
          cart.value.items[index].quantity! + quantity;
    } else {
      var item = CartItem(quantity: quantity, product: product);
      cart.value.items.add(item);
    }
    product.quantity = product.quantity - quantity;
    updateCartQuantity();
    cart.refresh();
    provider
        .addToCart(productId: product.id, quantity: quantity)
        .then((response) {
      int index = cart.value.items
          .indexWhere((element) => element.product?.id == product.id);
      if (response.success) {
        if (index != -1) {
          var item = cart.value.items[index];
          item.id = response.data?.id;
        }
        Get.snackbar("Bag Updated", "Item added to Bag");
      } else {
        product.quantity = product.quantity + quantity;
        Get.snackbar("Bag Update Failed", "Unable to add item in bag");
        fetchCart();
      }
    });
  }

  void saveCartItem({required Product product, required int quantity}) {}

  void updateCartItem(CartItem item, int quantity) {
    item.quantity = item.quantity! + quantity;
    print("quantity ${item.quantity}");
    if (item.quantity! <= 0) {
      print("deleteing item");
      cart.value.items.remove(item);
    }
    item.product?.quantity = item.product!.quantity - quantity;
    // cart.update((value) {
    //   print("updating");
    //   value!.items = [...value.items];
    // });
    cart.value.items = [...cart.value.items];
    cart.refresh();
    updateCartQuantity();
    provider
        .addToCart(productId: item.product?.id, quantity: quantity)
        .then((response) {
      if (response.hasError) {
        item.product?.quantity = item.product!.quantity - quantity;
        Get.snackbar("Bag Update Failed", "Unable to add item in bag");
        fetchCart();
      } else {
        Get.snackbar("Bag Updated", "");
      }
    });
  }

  void placeOrder() {
    final provider = OrderProvider(baseUrl: Constants.apiUrl);
    saving.value = true;
    hasErrors.value = false;
    provider.placeOrder().then((response) {
      if (response.success) {
        saving.value = false;
        hasErrors.value = false;
        fetchCart();
        Get.snackbar("Request Placed", "Successfully placed request");
      } else {
        fetchCart();
        saving.value = false;
        hasErrors.value = true;
        Get.snackbar("Request failed", "unable to place request");
      }
    });
  }
}
