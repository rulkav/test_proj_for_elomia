import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/models/chat_model.dart';
import 'package:tet_proj_for_elomia/providers/client_provider.dart';

class ChatController extends GetxController {
  bool editingText = false;
  ChatModel? messages;
  TextEditingController messageController = TextEditingController();
  ScrollController listController = ScrollController();
  ClientProvider clientProvider = ClientProvider();

  Future getChatMessages() async {
    log('Get all messages...');
    await clientProvider.getChatMessage(
      onSuccess: (data) async {
        log('Success!!!!!!');
        // messages?.clear();
        // messages = [];
        // messages?.addAll(data);
        messages = data;
        update();
        log('${messages}');
      },
      onError: (error) {
        log("Error $error");
      },
    );
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
}
