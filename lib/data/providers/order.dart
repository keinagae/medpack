import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/data/modals/order.dart';
import 'package:medpack/utils/s_response.dart';

class OrderProvider {
  late Dio httpClient;
  OrderProvider({String baseUrl = ""}) {
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

  Future<SResponse<List<Order>>> getOrders() async {
    try {
      final response = await httpClient.get("order/");
      return SResponse.fromResponse(
          response: response,
          responseParser: (response) {
            return (response.data as List<dynamic>)
                .map((e) => Order.fromJson(e))
                .toList();
          });
    } catch (exception) {
      return SResponse<List<Order>>.fromError(exception);
    }
  }

  Future<SResponse<Order>> placeOrder() async {
    try {
      final response = await httpClient.post("order/add");
      final data = SResponse<Order>.fromResponse(
          response: response,
          responseParser: (responce) => Order.fromJson(response.data));
      return data;
    } catch (exception) {
      return SResponse<Order>.fromError(exception);
    }
  }
}
