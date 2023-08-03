import 'package:elearning/core/values/colors.dart';
import 'package:elearning/presentation/exercise/list/exercise_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/model/exercise_list_response.dart';
import '../../../routes/routes.dart';

/// Arguments untuk dibawa saat pindah/navigate ke halaman ExerciseListPage
class ExerciseListPageArgs {
  final String courseId; // Buat get data dari API exercises
  final String courseName; // Buat ditampilkan Appbar

  const ExerciseListPageArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({Key? key}) : super(key: key);

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  @override
  void initState() {
    super.initState();
    // Call API
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseListController>(
      builder: (ExerciseListController controller) {
        List<ExerciseListData> exercises = controller.exerciseList;

        return Scaffold(
          appBar: AppBar(
            title: Text(controller.courseName),
          ),
          body: controller.isExerciseListLoading
              ? const Center(child: CircularProgressIndicator())
              : exercises.isEmpty
                  ? const Center(
                      child: Text('Yah, Paket tidak tersedia'),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 153 / 96,
                      ),
                      padding: const EdgeInsets.all(20),
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.exerciseQuestionsForm, arguments: exercises[index].exerciseId);
                          },
                          child: Center(
                            child: Text(exercises[index].exerciseTitle ?? ''),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}
