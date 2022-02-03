import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/models/concerns.dart';

class AuthScreenController extends GetxController {
  List<ConcernsModel>? concerns;

  Future<void> readConcernsJson() async {
    final dynamic response =
        await rootBundle.loadString('assets/jsons/concerns.json');
    final list = json.decode(response) as List<dynamic>;
    concerns = list.map((e) => ConcernsModel.fromJson(e)).toList();
    // print('${await concerns.toString()}');
  }

  @override
  void onInit() async {
    // await readConcernsJson();
    super.onInit();
  }
}
