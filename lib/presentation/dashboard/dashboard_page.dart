import 'package:elearning/presentation/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'exercise/exercise_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = controller.selectedNavIndex.value;
      return Scaffold(
        body: _bodyList()[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            controller.navigateTo(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined),
              label: 'Diskusi Soal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }

  List<Widget> _bodyList() => [
        const HomePage(),
        const ExercisePage(),
        const ProfilePage(),
      ];
}
