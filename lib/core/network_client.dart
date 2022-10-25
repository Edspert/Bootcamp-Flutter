import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class NetworkClient {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post(String url, {required body});
}

class DioClientImpl implements NetworkClient {
  late Dio _dio;

  DioClientImpl() {
    _initApiClient();
  }

  void _initApiClient() {
    const baseUrl = String.fromEnvironment('BASE_URL');
    const apiKey = String.fromEnvironment('API_KEY');

    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "x-api-key": apiKey,
        HttpHeaders.contentTypeHeader: "application/json"
      },
      responseType: ResponseType.json,
    );
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger(
      compact: kDebugMode,
      error: kDebugMode,
      logPrint: (value) => developer.log(value.toString()),
      request: kDebugMode,
      requestBody: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: kDebugMode,
    ));
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioError catch (e) {
      if (e.response?.data != null) throw Exception(e.response?.data);

      throw Exception(e.message);
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    required body,
    bool authorization = false,
  }) async {
    try {
      final response = await _dio.post(url, data: body);

      return response.data;
    } on DioError catch (e) {
      if (e.response?.data != null) throw Exception(e.response?.data);

      throw Exception(e.message);
    }
  }
}
