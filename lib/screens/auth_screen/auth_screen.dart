import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/constants/app_color.dart';
import 'package:tet_proj_for_elomia/constants/app_images.dart';
import 'package:tet_proj_for_elomia/screens/auth_screen/bottom_block.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 12),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              cGradientDarkBlue,
              cBlack,
            ],
          )),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 22,
                right: 22,
                child: GestureDetector(
                  // onTap: () => Get.back(),
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: cButtonClose.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(40)),
                      child: SvgPicture.asset(
                        iClose,
                        width: 13.31,
                        height: 13.31,
                        fit: BoxFit.scaleDown,
                      )),
                ),
              ),
              Positioned(
                  top: -70,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Image.asset(
                        mainScreenImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              const Positioned(bottom: 0, child: BottomBlock()),
            ],
          ),
        ),
      ),
    );
  }
}
