import 'package:elearning/presentation/auth/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        child: Text('Logout'),
        onPressed: () {
          Get.find<LoginController>().signOut();
        },
      ),
    );
  }
}
