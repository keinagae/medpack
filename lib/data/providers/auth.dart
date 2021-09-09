
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medpack/constants/constants.dart';

class AuthProvider {
  late Dio httpClient;
  AuthProvider({String baseUrl=""})
  {
    httpClient=Dio(BaseOptions(baseUrl: baseUrl));
  }
  Future<Response> login({required String username,required String password}) async{

    final response= await httpClient.post("auth/token/login/", data: {
        "email":username,
        "password":password
    });
    if(response.statusCode==200){
      final box = GetStorage();
      box.write("token", response.data['auth_token']);
    }

    return response;
  }
  Future<Response> signup({required String username,required String password}) async{

    final response= await httpClient.post("auth/users/", data: {
      "username":username,
      "password":password,
      "email":username
    });
    if(response.statusCode==200){
      print(response.data);
    }

    return response;
  }

}