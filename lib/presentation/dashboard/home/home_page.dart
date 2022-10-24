import 'package:elearning/presentation/dashboard/home/home_courses_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 50,
          color: Colors.green,
          child: const Text('Profile Header'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Single Banner'),
        ),
        const HomeCoursesWidget(),
        Container(
          height: 100,
          color: Colors.red,
          child: const Text('Event Banners'),
        ),
      ],
    );
  }
}
