import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/utils/s_response.dart';

class ProductProvider {
  late Dio httpClient;
  ProductProvider({String baseUrl = ""}) {
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

  Future<SResponse<Product>> create(Map<String, dynamic> data) async {
    var formData = FormData.fromMap(
        {...data, 'image': await MultipartFile.fromFile(data['image'])});
    try {
      final response = await httpClient.post("products/my/", data: formData);
      return SResponse.fromResponse(
          response: response, responseParser: (data) => Product.fromJson(data));
    } catch (exception) {
      return SResponse.fromError(exception);
    }
  }

  Future<SResponse<List<Product>>> list() async {
    try {
      final response = await httpClient.get(
        "products/",
      );
      final successResponse = SResponse<List<Product>>.fromResponse(
          response: response,
          responseParser: (response) {
            return (response.data as List<dynamic>)
                .map((e) => Product.fromJson(e))
                .toList();
          });
      return successResponse;
    } catch (error) {
      final errorResponse = SResponse<List<Product>>.fromError(error);
      return errorResponse;
    }
  }
}
