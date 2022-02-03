import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/app/bindings.dart';
import 'package:tet_proj_for_elomia/routes.dart';
import 'package:tet_proj_for_elomia/screens/auth_screen/auth_screen.dart';
import 'package:tet_proj_for_elomia/screens/selection_screen/selection_screen.dart';

class Elomia extends StatelessWidget {
  const Elomia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Elomia test project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() => setupBindings()),
      home: const Scaffold(
        body: AuthScreen(),
      ),
      getPages: getPages,
      //  [
      //   GetPage(name: '/', page: () => const AuthScreen()),
      //   GetPage(name: '/chose_screen', page: () => const SelectionScreen())
      // ],
    );
  }
}
