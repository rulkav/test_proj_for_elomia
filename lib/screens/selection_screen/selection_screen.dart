import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/constants/app_color.dart';
// import 'package:tet_proj_for_elomia/constants/app_routes.dart';
import 'package:tet_proj_for_elomia/constants/app_style.dart';
import 'package:tet_proj_for_elomia/screens/auth_screen/auth_controller.dart';
import 'package:tet_proj_for_elomia/screens/selection_screen/button_get_started.dart';
import 'package:tet_proj_for_elomia/screens/selection_screen/concerns_item.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: GetBuilder<AuthScreenController>(
            // init: AuthScreenController(),
            builder: (authScreenController) {
          return Stack(alignment: Alignment.bottomCenter, children: [
            Column(children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 24, bottom: 24, left: 32, right: 27),
                child: Column(
                  children: [
                    Text(
                      'What are your concerns?',
                      style: text(fsLarge, color: cWhite),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Text(
                        'Choose three things you want to work on first',
                        style: text(fsBig, color: cWhite),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: authScreenController.concerns == null
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: authScreenController.concerns?.length,
                          itemBuilder: (BuildContext context, index) {
                            return ConcernsItem(
                                // index: index,
                                head:
                                    authScreenController.concerns?[index].head);
                          }))
            ]),
            const ButtonGetStarted(),
            // const SizedBox(height: 48)
          ]);
        }),
      ),
    );
    // );
  }
}
