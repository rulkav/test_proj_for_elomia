import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/constants/app_color.dart';
import 'package:tet_proj_for_elomia/constants/app_images.dart';
import 'package:tet_proj_for_elomia/constants/app_style.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/chat_controller.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/chat_message_list.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (chatController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 63,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => print(chatController.messages),
                      child: Image.asset(
                        chatElomia,
                        width: 45,
                        height: 45,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Elomia',
                          style: text(fsBig, color: cWhite),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'will reply in 30 sec',
                          style: text(fsSSmall, color: cMilkWhite),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(child: ChatMessagesList()),
              chatController.editingText == true
                  ? AnimatedDots(chatController: chatController)
                  : const SizedBox(),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width - 32,
                  height: 42,
                  decoration: BoxDecoration(
                      color: cMilkWhite,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                      maxLines: 1,
                      controller: chatController.messageController,
                      onSubmitted: (text) {
                        chatController.editingText = false;
                        chatController.update();
                        chatController.messageController.clear();
                      },
                      onChanged: (value) {
                        chatController.editingText = true;
                        chatController.update();
                        chatController.listController.jumpTo(chatController
                            .listController.position.maxScrollExtent);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Message...',
                          suffixIcon: SvgPicture.asset(
                            iSend,
                            width: 21,
                            height: 17,
                            fit: BoxFit.scaleDown,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 8),
                          hintStyle: text(fsBig,
                              color: cTextFieldHint.withOpacity(0.6))),
                      style:
                          text(fsBig, color: cTextFieldHint.withOpacity(0.6))),
                ),
              ),
            ],
          );
        });
  }
}

class AnimatedDots extends StatefulWidget {
  final ChatController chatController;
  const AnimatedDots({Key? key, required this.chatController})
      : super(key: key);

  @override
  State<AnimatedDots> createState() => _AnimatedDotsState();
}

class _AnimatedDotsState extends State<AnimatedDots> {
  int durationAnimation = 150;
  int dot1Index = 0;
  int dot2Index = 0;
  int dot3Index = 0;
  bool onDot1Animate = false;
  bool onDot2Animate = false;
  bool onDot3Animate = false;
  bool doAnimate = false;
  List<Alignment> alignment = [
    Alignment.bottomCenter,
    Alignment.center,
    Alignment.topCenter,
    Alignment.center,
    Alignment.bottomCenter
  ];

  void animate() {
    if (doAnimate && dot1Index < 4) {
      dot1Index = dot1Index + 1;
      onDot1Animate = true;
    }
    if (!doAnimate) {
      onDot1Animate = false;
      onDot2Animate = false;
      onDot3Animate = false;
      dot1Index = 0;
      dot2Index = 0;
      dot3Index = 0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (chatController) {
      if (doAnimate != chatController.editingText) {
        doAnimate = chatController.editingText == true ? true : false;
        Future.delayed(const Duration(milliseconds: 100), () => animate());
      }
      return GestureDetector(
        onTap: () {
          doAnimate = !doAnimate;
          animate();
        },
        child: Container(
            // color: Colors.amber,
            padding: const EdgeInsets.all(1),
            width: 40,
            height: 23,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: cMilkWhite),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: durationAnimation),
                  onEnd: () => setState(() {
                    if (doAnimate) {
                      if (doAnimate && dot1Index < 4) {
                        dot1Index = dot1Index + 1;
                      }
                      onDot1Animate = (dot1Index == 4) ? false : true;
                      if (dot1Index == 2 && !onDot2Animate) {
                        dot2Index = 1;
                        onDot2Animate = true;
                      }
                    }
                  }),
                  alignment: alignment[dot1Index],
                  height: 13,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6), color: cGrey),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: durationAnimation),
                  onEnd: () => setState(() {
                    if (doAnimate) {
                      if (doAnimate && dot2Index < 4) {
                        dot2Index = dot2Index + 1;
                      }
                      onDot2Animate = (dot2Index == 4) ? false : true;
                      if (dot2Index == 2 && !onDot3Animate) {
                        dot3Index = 1;
                        onDot3Animate = true;
                      }
                    }
                  }),
                  alignment: alignment[dot2Index],
                  height: 13,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6), color: cGrey),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: durationAnimation),
                  onEnd: () => setState(() {
                    if (doAnimate) {
                      if (doAnimate && dot3Index < 4) {
                        dot3Index = dot3Index + 1;
                      }
                      onDot3Animate = (dot3Index == 4) ? false : true;
                      if (dot1Index == 4 && dot2Index == 4 && dot3Index == 4) {
                        dot1Index = 1;
                        onDot1Animate = true;
                      }
                    }
                  }),
                  alignment: alignment[dot3Index],
                  height: 13,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6), color: cGrey),
                  ),
                ),
              ],
            )),
      );
    });
  }
}
