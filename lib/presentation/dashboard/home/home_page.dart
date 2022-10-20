import 'package:elearning/data/model/course_response.dart';
import 'package:elearning/presentation/course/course_list_controller.dart';
import 'package:elearning/presentation/dashboard/home/home_courses_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 50,
          color: Colors.green,
          child: Text('Profile Header'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: Text('Single Banner'),
        ),
        const HomeCoursesWidget(),
        Container(
          height: 100,
          color: Colors.red,
          child: Text('Event Banners'),
        ),
      ],
    );
  }
}
