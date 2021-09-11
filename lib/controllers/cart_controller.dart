import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/cart.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/data/providers/cart.dart';
import 'package:medpack/data/providers/order.dart';

class CartController extends GetxController {
  var cart = Cart().obs;
  var cartQuantity = 0.obs;
  CartProvider provider = CartProvider(baseUrl: Constants.apiUrl);

  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }

  void fetchCart() {
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

  void updateCartQuantity() {
    cartQuantity.value = 0;
    cart.value.items.forEach((element) {
      cartQuantity.value += element.quantity ?? 0;
    });
    updateCartQuantity();
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
        Get.showSnackbar(GetBar(
          message: "cart Updated",
          duration: Duration(milliseconds: 1000),
        ));
      } else {
        Get.showSnackbar(GetBar(
          message: "Unable to update cart",
          duration: Duration(milliseconds: 1000),
        ));
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
        Get.showSnackbar(GetBar(
          message: "Unable to update cart",
          duration: Duration(milliseconds: 1000),
        ));
        fetchCart();
      } else {
        Get.showSnackbar(GetBar(
          message: "Cart updated",
          duration: Duration(milliseconds: 1000),
        ));
      }
    });
  }

  void placeOrder() {
    final provider = OrderProvider(baseUrl: Constants.apiUrl);
    provider.placeOrder().then((response) {
      if (response.success) {
        fetchCart();
        Get.showSnackbar(GetBar(
          message: "Reuest placed",
          duration: Duration(milliseconds: 1000),
        ));
      } else {
        fetchCart();
        Get.showSnackbar(GetBar(
          message: "un able to place request",
          duration: Duration(milliseconds: 1000),
        ));
      }
    });
  }
}
