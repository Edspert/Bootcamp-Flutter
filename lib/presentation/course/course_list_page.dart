import 'package:cached_network_image/cached_network_image.dart';
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

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: courses.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
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
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(children: [
                      CachedNetworkImage(
                        imageUrl: courses[index].urlCover ?? '',
                        height: 80,
                        width: 80,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.book, size: 80),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(courses[index].courseName ?? ''),
                            Text('${courses[index].jumlahDone}/${courses[index].jumlahMateri} Paket latihan soal'),
                            LinearProgressIndicator(
                              value: (courses[index].jumlahDone ?? 0) /
                                  (courses[index].jumlahMateri == 0 ? 1 : courses[index].jumlahMateri!),
                            ),
                          ],
                        ),
                      )
                    ]),
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
