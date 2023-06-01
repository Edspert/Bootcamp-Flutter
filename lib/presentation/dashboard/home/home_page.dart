import 'package:elearning/data/model/course_response.dart';
import 'package:elearning/presentation/course/course_list_controller.dart';
import 'package:elearning/presentation/dashboard/home/home_courses_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';
import 'home_controller.dart';
import 'home_profile_widget.dart';
import 'home_top_banner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const HomeProfileWidget(),
        const HomeTopBannerWidget(),
        const HomeCoursesWidget(),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
      ],
    );
  }

  Widget _mobileWidget() {
    return Container();
  }

  Widget _tabletWidget() {
    return Container();
  }

  Widget _landscapeWidget() {
    return Container();
  }
}
