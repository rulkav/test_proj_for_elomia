import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/screens/auth_screen/auth_controller.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/chat_controller.dart';

setupBindings() => {
      Get.lazyPut(() => AuthScreenController()),
      Get.lazyPut(() => ChatController()),
    };
