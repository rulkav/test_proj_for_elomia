import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/constants/app_color.dart';
import 'package:tet_proj_for_elomia/constants/app_images.dart';
import 'package:tet_proj_for_elomia/constants/app_routes.dart';
import 'package:tet_proj_for_elomia/constants/app_style.dart';
import 'package:tet_proj_for_elomia/screens/auth_screen/auth_controller.dart';

class BottomBlock extends StatelessWidget {
  const BottomBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            width: 312,
            height: 184,
            child: Image.asset(mainScreenChat),
          ),
          const SizedBox(height: 16),
          Text('Meet Elomia', style: text(fsLarge, color: cWhite)),
          const SizedBox(height: 12),
          Text(
            'An AI-powered companion that helps\n to improve mental health',
            style: text(fsBig, color: cWhite),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              Get.find<AuthScreenController>().readConcernsJson();

              Get.offNamed(RoutePaths.selectionScreen);
            },
            // onTap: () => Get.toNamed(RoutePaths.selectionScreen),

            child: Container(
              width: 311,
              height: 54,
              decoration: BoxDecoration(
                  color: cWhite, borderRadius: BorderRadius.circular(12)),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(iAppleLogo),
                    Text(
                      'Continue with Apple',
                      style: text(fsBig),
                    )
                  ]),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'PREVIEW THE APP',
            textAlign: TextAlign.center,
            style: text(fsSmall, color: cWhite),
          )
        ],
      ),
    );
  }
}
