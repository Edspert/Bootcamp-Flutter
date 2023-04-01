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
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              'asdfgjkaklsdfgj;sdfjg lsdfjgl ksdfjgkj sdklfjgkl sdjfkglj sdklfjg klsdjfg lkjsdfglkj sdfklgj sdklfjg klsdjfg kljsdfg asdfasdf adfgsdfg sdfhsdfhsdf hsdfh sdfh sdf hsdfh',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 32),
            ),
          ),
          Container(
            height: 80,
            color: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('asdfasdf'),
                    Text('asdfasdf'),
                  ],
                ),
                Icon(Icons.ad_units),
              ],
            ),
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
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Event Banners'),
          ),
        ],
      ),
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
