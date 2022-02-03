import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:tet_proj_for_elomia/constants/app_color.dart';
// import 'package:tet_proj_for_elomia/constants/app_images.dart';
// import 'package:tet_proj_for_elomia/constants/app_style.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/chat_controller.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/message_item.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (chatController) {
          return ListView.builder(
              itemCount: chatController.messages?.chatHistory?.length ?? 0,
              controller: chatController.listController,
              itemBuilder: (context, index) {
                return chatController.messages == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListTile(
                        title: MessageItem(
                          chatController: chatController,
                          index: index,
                        ),
                      );
              });
        });
  }
}
