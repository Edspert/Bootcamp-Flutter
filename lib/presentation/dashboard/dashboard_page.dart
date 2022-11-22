import 'package:elearning/presentation/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_page.dart';
import 'profile/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = controller.selectedNavIndex.value;
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              _bodyList()[selectedIndex],
              GetBuilder<DashboardController>(builder: (controller) {
                bool isOnline = controller.isOnline;
                if (isOnline) {
                  return SizedBox();
                } else {
                  return Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.yellow,
                      child: Text('No Connection'),
                    ),
                  );
                }
              })
            ],
          ),
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
        ),
      );
    });
  }

  List<Widget> _bodyList() => [
        const HomePage(),
        const Placeholder(child: Text('Diskusi Soal')),
        const ProfilePage(),
      ];
}
