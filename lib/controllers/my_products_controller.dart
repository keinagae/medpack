import 'package:get/get.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/data/providers/product.dart';

class MyProductsController extends GetxController {
  var products = [].obs;
  ProductProvider provider = ProductProvider(baseUrl: Constants.apiUrl);
  Rx<bool> loading = false.obs;
  Rx<bool> hasErrors = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  Future<dynamic> fetchProducts() {
    loading.value = true;
    hasErrors.value = false;
    return provider.myProducts().then((respopnse) {
      if (respopnse.success) {
        products.clear();
        products.addAll(respopnse.data ?? []);
        products.refresh();
        loading.value = false;
        hasErrors.value = false;
      } else {
        loading.value = false;
        hasErrors.value = true;
      }
    });
  }

  void updateProduct(Product product) {
    int index = products.indexWhere((element) => element.id == product.id);
    if (index > -1) {
      products[index] = product;
      products.refresh();
    }
  }
}
