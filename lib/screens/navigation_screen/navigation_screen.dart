import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tet_proj_for_elomia/constants/app_color.dart';
import 'package:tet_proj_for_elomia/constants/app_images.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/chat_controller.dart';
import 'package:tet_proj_for_elomia/screens/navigation_screen/chat_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  void initState() {
    ChatController chatController = Get.find();
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Exercises',
      style: optionStyle,
    ),
    Text(
      'Insights',
      style: optionStyle,
    ),
    ChatPage(),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) Get.find<ChatController>().getChatMessages();
    });
  }

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
              cChecked,
            ],
          )),
          child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(iExercises),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(iInsights),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(iChat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(iSettings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
