import 'package:elearning/data/model/course_response.dart';
import 'package:elearning/presentation/course/course_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../exercise/list/exercise_list_page.dart';

class CourseListPage extends GetView<CourseListController> {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Pelajaran'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: GetBuilder<CourseListController>(
          builder: (CourseListController courseController) {
            List<CourseData> courses = courseController.courseList;

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(courses[index].courseName ?? ''),
                  onTap: () {
                    Get.toNamed(Routes.exerciseList,
                        arguments: ExerciseListPageArgs(
                          courseId: courses[index].courseId!,
                          courseName: courses[index].courseName ?? '',
                        ));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
