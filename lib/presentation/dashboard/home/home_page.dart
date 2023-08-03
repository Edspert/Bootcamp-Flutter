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
        const HomeProfileWidget(name: 'Leo'),
        const HomeTopBannerWidget(),
        const HomeCoursesWidget(),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                height: 100,
                child: Image.network(
                    'https://eduhero.widyaedu.com/assets/images/thumbnail/e5c07ce5e92384a7631331a509300b3d.png'),
              );
            },
          ),
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
