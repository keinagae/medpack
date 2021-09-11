import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/data/modals/cart.dart';
import 'package:medpack/utils/s_response.dart';

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

  Future<SResponse<Cart>> cart() async {
    try {
      final response = await httpClient.get("cart/");
      return SResponse.fromResponse(
          response: response,
          responseParser: (response) => Cart.fromJson(response.data));
    } catch (exception) {
      final response = SResponse<Cart>.fromError(exception);
      print(response.inputErrors);
      print(response.hasError);
      print(response.errorMsg);
      return response;
    }
  }

  Future<SResponse<CartItem>> addToCart({int? productId, int? quantity}) async {
    Map<String, dynamic> data = {
      "product_id": productId,
      "quantity": quantity,
    };
    try {
      final response = await httpClient.post("cart/add", data: data);
      return SResponse.fromResponse(
          response: response,
          responseParser: (date) => CartItem.fromJson(date.data));
    } catch (exception) {
      return SResponse.fromError(exception);
    }
  }
}
