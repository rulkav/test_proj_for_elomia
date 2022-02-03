import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/constants/app_color.dart';
import 'package:tet_proj_for_elomia/constants/app_style.dart';
import 'package:tet_proj_for_elomia/screens/auth_screen/auth_controller.dart';

class ConcernsItem extends StatelessWidget {
  final String? head;

  final int? index;

  const ConcernsItem({
    Key? key,
    this.index,
    required this.head,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthScreenController authScreenController = Get.find();
    return GestureDetector(
      onTap: () {
        authScreenController.concerns
                ?.firstWhere((e) => e.head == head)
                .selected =
            !authScreenController.concerns!
                .firstWhere((e) => e.head == head)
                .selected!;
        authScreenController.update();
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 64,
        margin: (authScreenController.concerns
                    ?.firstWhere((element) => element.head == head)
                    .selected ==
                false)
            ? const EdgeInsets.only(left: 32, right: 32, bottom: 16)
            : const EdgeInsets.only(left: 32, right: 32, bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
        decoration: BoxDecoration(
          color: cBlockBackground,
          borderRadius: BorderRadius.circular(12),
          border: (authScreenController.concerns
                      ?.firstWhere((element) => element.head == head)
                      .selected ==
                  false)
              ? Border.all(color: cBlockBorder)
              : Border.all(color: cChecked, width: 2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (authScreenController.concerns
                        ?.firstWhere((element) => element.head == head)
                        .selected ==
                    false)
                ? Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: cBlockBorder)),
                  )
                : Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(color: cBlockBorder)
                        color: cChecked),
                    child: const Icon(
                      Icons.check,
                      color: cWhite,
                      size: 16,
                    ),
                  ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${index != null ? index : ''}$head',
                      style: text(fsSBig, color: cWhite)),
                  (authScreenController.concerns
                              ?.firstWhere((element) => element.head == head)
                              .body ==
                          '')
                      ? const SizedBox()
                      : const SizedBox(height: 10),
                  (authScreenController.concerns
                              ?.firstWhere((element) => element.head == head)
                              .body ==
                          '')
                      ? const SizedBox()
                      : Text(
                          '${authScreenController.concerns?.firstWhere((element) => element.head == head).body}',
                          style: text(fsSmall, color: cWhite)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
