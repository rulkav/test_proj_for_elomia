import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/constants/app_color.dart';
import 'package:tet_proj_for_elomia/constants/app_routes.dart';
import 'package:tet_proj_for_elomia/constants/app_style.dart';
import 'package:tet_proj_for_elomia/screens/auth_screen/auth_controller.dart';

class ButtonGetStarted extends StatelessWidget {
  const ButtonGetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthScreenController>(builder: (authScreenController) {
      return (authScreenController.concerns!
                  .where((e) => e.selected == true)
                  .length >=
              3)
          ? GestureDetector(
              onTap: () => Get.offNamed(RoutePaths.navigationScreen),
              child: Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                width: MediaQuery.of(context).size.width - 64,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: cChecked),
                child: Text('Get started', style: text(fsBig, color: cWhite)),
              ),
            )
          : const SizedBox();
    });
  }
}
