import 'dart:ui';

import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/data/providers/product.dart';

class ProductsController extends GetxController {
  var products = <Product>[].obs;
  var loading = false.obs;
  ProductProvider provider = ProductProvider(baseUrl: Constants.apiUrl);
  @override
  void onInit() {
    super.onInit();
    loading.value = true;
    provider.list().then((value) {
      if (value.success) {
        products.addAll(value.data ?? []);
      }
    });
  }

  void addProduct(Product product) {
    products.add(product);
    products.refresh();
  }
}
