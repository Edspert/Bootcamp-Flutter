import 'package:elearning/data/model/course_response.dart';
import 'package:elearning/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../exercise/list/exercise_list_page.dart';
import 'home_controller.dart';

class HomeCoursesWidget extends StatefulWidget {
  const HomeCoursesWidget({Key? key}) : super(key: key);

  @override
  State<HomeCoursesWidget> createState() => _HomeCoursesWidgetState();
}

class _HomeCoursesWidgetState extends State<HomeCoursesWidget> {
  @override
  void initState() {
    Get.find<HomeController>().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        List<CourseData> courses = controller.courseList;
        return Column(
          children: [
            if (courses.length > 3)
              TextButton(
                child: const Text('Lihat Semua'),
                onPressed: () {
                  Get.toNamed(Routes.courseList);
                },
              ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: courses.length > 3 ? 3 : courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(courses[index].courseName ?? ''),
                  onTap: () {
                    Get.toNamed(Routes.exerciseList, arguments: ExerciseListPageArgs(
                      courseId: courses[index].courseId!,
                      courseName: courses[index].courseName ?? '',
                    ));
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
