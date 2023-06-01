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
          // TODO: Call API getCourses()
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: GetBuilder<CourseListController>(
          builder: (CourseListController courseController) {
            List<CourseData> courses = courseController.courseList;

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.exerciseList,
                      arguments: ExerciseListPageArgs(
                        courseId: courses[index].courseId ?? '',
                        courseName: courses[index].courseName ?? '',
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 18),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.abc),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(courses[index].courseName ?? ''),
                              if (courses[index].jumlahMateri! > 0)
                                Text(
                                  '${courses[index].jumlahDone}/${courses[index].jumlahMateri} Paket Latihan Soal',
                                ),
                              if (courses[index].jumlahMateri! > 0)
                                LinearProgressIndicator(
                                  value: (courses[index].jumlahDone!) / (courses[index].jumlahMateri!),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                return ListTile(
                  title: Text(courses[index].courseName ?? ''),
                  onTap: () {
                    Get.toNamed(
                      Routes.exerciseList,
                      arguments: ExerciseListPageArgs(
                        courseId: courses[index].courseId!,
                        courseName: courses[index].courseName ?? '',
                      ),
                    );
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
