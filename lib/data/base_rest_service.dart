import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as g;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tet_proj_for_elomia/constants/app_url_request.dart';

class BaseRestService extends g.GetxController {
  String baseUrl = AppUrlRequestKeys.baseUrl;
  String chatUrl = AppUrlRequestKeys.chatUrl;
  // Preferences preferences = locator<Preferences>();
  static PrettyDioLogger dioLog = PrettyDioLogger(
      requestHeader: kReleaseMode ? false : true,
      requestBody: kReleaseMode ? false : true,
      responseBody: kReleaseMode ? false : true,
      responseHeader: kReleaseMode ? false : true,
      compact: kReleaseMode ? false : true,
      maxWidth: kReleaseMode ? 0 : 120);
  //
  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      };

  Dio _dio() => Dio(BaseOptions(baseUrl: baseUrl, headers: headers))
    ..interceptors.add(dioLog);

  void get({
    String? url,
    Map<String, dynamic>? data,
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  }) {
    _dio().get('$baseUrl$url', queryParameters: data).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      log('Error $error');
      // parseStatusCodeError(
      //     error.response?.statusCode, error.response!.data['message']);
      if (onError != null) onError(error);
    });
  }
}
