import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tet_proj_for_elomia/screens/auth_screen/auth_screen.dart';
// import 'package:tet_proj_for_elomia/screens/chat_screen/chat_screen.dart_';
import 'package:tet_proj_for_elomia/screens/navigation_screen/navigation_screen.dart';
import 'package:tet_proj_for_elomia/screens/selection_screen/selection_screen.dart';

import 'constants/app_routes.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: RoutePaths.mainScreen, page: () => const AuthScreen()),
  GetPage(
      name: RoutePaths.selectionScreen, page: () => const SelectionScreen()),
  // GetPage(name: RoutePaths.chatScreen, page: () => const ChatScreen()),
  GetPage(
      name: RoutePaths.navigationScreen, page: () => const NavigationScreen()),
];
