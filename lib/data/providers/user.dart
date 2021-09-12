import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/data/modals/auth_model.dart';
import 'package:medpack/utils/s_response.dart';

class UserProvider {
  late Dio httpClient;
  UserProvider({String baseUrl = ""}) {
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
  Future<SResponse<User>> me() async {
    try {
      final response = await httpClient.get("auth/users/me/");
      return SResponse<User>.fromResponse(
          response: response,
          responseParser: (response) => User.fromJson(response.data));
    } catch (exception) {
      return SResponse.fromError(exception);
    }
  }

  Future<SResponse<User>> saveProfile(Map<String, dynamic> data) async {
    try {
      final response = await httpClient.patch("users/profile", data: data);
      final saveResponse = SResponse.fromResponse(
          response: response, responseParser: (response) => response.data);
      final me = await this.me();
      return me;
    } catch (exception) {
      return SResponse<User>.fromError(exception);
    }
  }
}
