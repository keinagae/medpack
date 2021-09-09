import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/data/modals/cart.dart';

class CartProvider {
  late Dio httpClient;
  CartProvider({String baseUrl = ""}) {
    httpClient = Dio(BaseOptions(baseUrl: baseUrl));
    httpClient.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (GetStorage().read('token') != null) {
          options.headers["Authorization"] =
              "Token ${GetStorage().read('token')}";
        }

        return handler.next(options);
      },
    ));
  }

  Future<Cart> cart() async {
    final response = await httpClient.get("cart/");
    Cart cart = Cart.fromJson(response.data);
    return cart;
  }
}
