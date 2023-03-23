

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:technical_assessment/Service/environment_variables.dart';

class ApiInterceptor {
  static final ApiInterceptor _apiClient = ApiInterceptor._internal();
  final Dio _dio = Dio();

  factory ApiInterceptor() {
    return _apiClient;
  }

  Dio get client => _dio;

  ApiInterceptor._internal() {
    _dio.options.baseUrl = EnvironmentVariables.baseUrl;
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) =>
            requestInterceptor(options, handler),
        onResponse: (Response response, ResponseInterceptorHandler handler) =>
            responseInterceptor(response, handler),
        onError: (DioError dioError, ErrorInterceptorHandler handler) =>
            errorInterceptorHandler(dioError, handler)));
  }
}

dynamic requestInterceptor(
    RequestOptions options, RequestInterceptorHandler handler) async {
  if (kDebugMode) {
    print("hit request interceptor");
    print("data => \n ${options.data}");
    print("Request url => ${options.baseUrl + options.path}");
  }
  return handler.next(options);
}

dynamic responseInterceptor(
    Response response, ResponseInterceptorHandler handler) async {
  if (kDebugMode) {
    print("hit response interceptor");
  }
  if (response.statusCode != null) {
    if (response.statusCode! >= 400) {
      if (kDebugMode) {
        print("${response.statusCode!}, ${response.data}");
      }
      throw "${response.statusCode!}, ${response.data}";
    } else {
      if (kDebugMode) {
        print("response data => \n ${response.data}");
      }
      return handler.next(response);
    }
  }
}

dynamic errorInterceptorHandler(
    DioError dioError, ErrorInterceptorHandler handler) {

  if (kDebugMode) {
    print("hit error interceptor");
    print("Error => \n$dioError");
  }
}
