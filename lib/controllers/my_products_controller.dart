import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/data/providers/product.dart';

class MyProductsController extends GetxController {
  var products = [].obs;
  ProductProvider provider = ProductProvider(baseUrl: Constants.apiUrl);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    provider.myProducts().then((respopnse) {
      if (respopnse.success) {
        products.clear();
        products.addAll(respopnse.data ?? []);
        products.refresh();
      }
    });
  }
}
