import 'package:dio/dio.dart';

import 'errors.dart';

class SResponse<T> {
  T? data;
  Response? response;
  bool success = false;
  bool hasError = false;
  bool serverError = false;
  bool inputError = false;
  bool unAuthenticatedError = false;
  Map<String, String> inputErrors = {};
  String errorMsg = "";
  T Function(Response response)? responseParser;

  SResponse.fromResponse(
      {required this.response, required this.responseParser}) {
    if (responseParser != null) {
      data = responseParser!(response!);
    }
    success = true;
    hasError = false;
    serverError = false;
    inputError = false;
    unAuthenticatedError = false;
  }

  SResponse.fromError(dynamic exception) {
    print(exception);
    final error = exception as DioError;
    hasError = true;
    success = false;

    if (error.response?.statusCode == 400) {
      inputError = true;
      serverError = false;
      parseErrors(error.response!.data);
    } else if (error.response?.statusCode == 401) {
      inputError = false;
      serverError = false;
      unAuthenticatedError = true;
    } else if (error.response?.statusCode == 500) {
      inputError = false;
      serverError = true;
      unAuthenticatedError = false;
      errorMsg = exception.toString();
    } else {
      inputError = false;
      serverError = false;
      unAuthenticatedError = false;
      errorMsg = exception.toString();
    }
  }
}
