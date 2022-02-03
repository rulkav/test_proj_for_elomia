import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tet_proj_for_elomia/constants/app_color.dart';
import 'package:tet_proj_for_elomia/constants/app_images.dart';
import 'package:tet_proj_for_elomia/constants/app_style.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/chat_controller.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/like_dislike.dart';

class MessageItem extends StatelessWidget {
  final ChatController chatController;
  final int index;

  const MessageItem(
      {Key? key, required this.chatController, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool botFlag =
        (chatController.messages!.chatHistory![index].author == 'bot');
    final bool reactionFlag =
        (chatController.messages!.chatHistory![index].reaction == 'like');
    final String? reaction = (chatController
                .messages!.chatHistory![index].reaction ==
            'like')
        ? iLikeChecked
        : (chatController.messages!.chatHistory![index].reaction == 'dislike')
            ? iDislikeChecked
            : null;
    return Stack(
      children: [
        Container(
            // color: Colors.amber,
            alignment: botFlag ? Alignment.bottomLeft : Alignment.bottomRight,
            // width: MediaQuery.of(context).size.width - 115,
            width: MediaQuery.of(context).size.width - 30,
            // margin: botFlag
            //     ? const EdgeInsets.only(left: 5, right: 85 /*, bottom: 5*/)
            //     : const EdgeInsets.only(left: 85 /*, bottom: 5*/),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  botFlag ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                botFlag
                    ? const SizedBox()
                    : Expanded(
                        child: Container(
                            width: 70, height: 30 /*, color: Colors.red*/)),
                Flexible(
                  flex: 3,
                  child: Stack(children: [
                    Positioned(
                      child: SvgPicture.asset(
                        botFlag ? iTailElomia : iTailUser,
                        width: 20,
                        height: 14,
                      ),
                      // left: -5,
                      bottom: 10,
                      left: botFlag ? 1 : null,
                      right: !botFlag ? 1 : null,
                    ),
                    Column(
                      children: [
                        Container(
                          //Size to max width
                          // width: botFlag
                          //     ? MediaQuery.of(context).size.width - 120
                          //     // : null,
                          //     : MediaQuery.of(context).size.width - 120,
                          margin: botFlag
                              ? const EdgeInsets.only(left: 5, right: 11)
                              // ? null
                              : const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: botFlag ? cMilkWhite : cPurple,
                          ),
                          child: Text(
                            '${chatController.messages!.chatHistory![index].text!}',
                            style:
                                text(fsBig, color: botFlag ? cBlack : cWhite),
                          ),
                        ),
                        const SizedBox(height: 9),
                      ],
                    ),
                    reactionFlag
                        ? Positioned(
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                // color: cWhite,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            right: 1,
                            bottom: 1)
                        : const SizedBox(),
                    reaction != null
                        ? Positioned(
                            child: SvgPicture.asset(reaction),
                            right: 1,
                            bottom: 1)
                        : const SizedBox(),
                  ]),
                ),
                // botFlag
                //     ? Expanded(
                //         child: SizedBox(),
                //       )
                //     : SizedBox(),
                botFlag
                    ? LikeDislikeWidget(
                        index: index, chatController: chatController)
                    : const SizedBox(),
              ],
            )),
      ],
    );
  }
}
