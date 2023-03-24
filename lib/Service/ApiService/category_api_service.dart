

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../Network/api_interceptor.dart';

class CategoryApiService{

  final Dio _apiClient = ApiInterceptor().client;

  Future<Response> getCustomerDetails(String category) async {
    Map<String,dynamic> queryParameters = {
      'category': category,
    };

    try {
      Response response = await _apiClient.get('news',  queryParameters: queryParameters);
      return response;

    } catch (e) {
      return Future.error(e);
    }

    }

  }