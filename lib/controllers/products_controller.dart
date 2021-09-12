import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/data/providers/product.dart';

class ProductsController extends GetxController {
  var products = <Product>[].obs;
  Rx<bool> loading = false.obs;
  Rx<bool> hasErrors = false.obs;
  final TextEditingController searchController = TextEditingController();
  ProductProvider provider = ProductProvider(baseUrl: Constants.apiUrl);
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<dynamic> fetchProducts() {
    loading.value = true;
    hasErrors.value = false;
    return provider.list(search: searchController.text).then((value) {
      if (value.success) {
        loading.value = false;
        hasErrors.value = false;
        products.clear();
        products.addAll(value.data ?? []);
      } else {
        loading.value = false;
        hasErrors.value = true;
      }
      return value;
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.dispose();
  }

  void addProduct(Product product) {
    products.add(product);
    products.refresh();
  }

  void updateProduct(Product product) {
    int index = products.indexWhere((element) => element.id == product.id);
    if (index > -1) {
      products[index] = product;
      products.refresh();
    }
  }
}
