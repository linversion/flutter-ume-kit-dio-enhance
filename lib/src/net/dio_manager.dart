import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioManager {
  static DioManager? _instance;
  String accessToken = '';
  static const int CONNECT_TIMEOUT = 15000;
  static const int RECEIVE_TIMEOUT = 15000;

  late Dio _dio;

  DioManager._internal() {
    var options = BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        headers: {'Content-Type': Headers.jsonContentType},
        baseUrl: 'https://oapi.dingtalk.com/');
    _dio = Dio(options);
  }

  static DioManager get instance => _instance ??= DioManager._internal();

  void setAccessToken(String token) {
    this.accessToken = token;
  }

  Future<bool> sendResponse({
    required String uri,
    required String requestData,
    required String responseBody,
    required String requestHeader,
    required String duration,
    required String statusCode,
    required String method,
  }) async {
    try {
      await _dio.post('robot/send', queryParameters: {
        'access_token': accessToken
      }, data: {
        "msgtype": "text",
        "text": {
          "content": "agent: dio\n$statusCode $method duration: $duration\n$uri\n\nrequest data: "
              "\n$requestData\n"
              "\nresponse body: \n$responseBody\n\nrequest header\n$requestHeader"
        }
      });
      return true;
    } catch (error) {
      debugPrint('error on send response');
      return false;
    }
  }
}
