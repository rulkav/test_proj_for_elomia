import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tet_proj_for_elomia/constants/app_url_request.dart';
import 'package:tet_proj_for_elomia/data/base_rest_service.dart';
import 'package:tet_proj_for_elomia/models/chat_model.dart';

class ClientProvider {
  final BaseRestService _api = BaseRestService();

  getChatMessage(
      {Function()? beforeSend,
      Function(dynamic data)? onSuccess,
      Function(DioError error)? onError}) {
    log('Get chat message...');
    _api.get(
      url: AppUrlRequestKeys.chatUrl,
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        log('Chat messages --------> ${data.data}');
        onSuccess!(ChatModel.fromJson(data.data));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
