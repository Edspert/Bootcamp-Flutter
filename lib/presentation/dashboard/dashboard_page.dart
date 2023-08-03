import 'package:elearning/presentation/dashboard/dashboard_controller.dart';
import 'package:elearning/presentation/dashboard/discussion/discussion_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_page.dart';
import 'profile/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        int selectedIndex = controller.selectedNavIndex;

        return Scaffold(
          // body: _bodyList()[selectedIndex],
          body: IndexedStack(
            index: selectedIndex,
            children: const [
              HomePage(),
              DiscussionPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              controller.navigateTo(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Discuss',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _bodyList() => [
        const HomePage(), // 0
        const DiscussionPage(), // 1
        const ProfilePage(), // 2
      ];
}
