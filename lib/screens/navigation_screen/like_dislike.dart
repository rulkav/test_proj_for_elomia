import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tet_proj_for_elomia/constants/app_images.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/chat_controller.dart';

class LikeDislikeWidget extends StatelessWidget {
  const LikeDislikeWidget({
    Key? key,
    required this.index,
    required this.chatController,
  }) : super(key: key);

  final int index;
  final ChatController chatController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 30,
      /*, color: Colors.red*/
      child: (index + 1 == chatController.messages?.chatHistory?.length)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5),
                GestureDetector(
                    onTap: () {
                      chatController.messages?.chatHistory![index].reaction ==
                              'like'
                          ? chatController
                              .messages?.chatHistory![index].reaction = null
                          : chatController
                              .messages?.chatHistory![index].reaction = 'like';
                      chatController.update();
                    },
                    child: SvgPicture.asset(
                        chatController.messages?.chatHistory![index].reaction ==
                                'like'
                            ? iLikeChecked
                            : iLike)),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      chatController.messages?.chatHistory![index].reaction ==
                              'dislike'
                          ? chatController
                              .messages?.chatHistory![index].reaction = null
                          : chatController.messages?.chatHistory![index]
                              .reaction = 'dislike';
                      chatController.update();
                    },
                    child: SvgPicture.asset(
                        chatController.messages?.chatHistory![index].reaction ==
                                'dislike'
                            ? iDislikeChecked
                            : iDislike)),
                const SizedBox(width: 5),
              ],
            )
          : const SizedBox(),
    );
  }
}
