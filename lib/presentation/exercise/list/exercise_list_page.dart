import 'package:elearning/core/values/colors.dart';
import 'package:elearning/presentation/exercise/list/exercise_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/exercise_list_response.dart';
import '../../../routes/routes.dart';

/// Arguments untuk dibawa saat pindah/navigate ke halaman ExerciseListPage
class ExerciseListPageArgs {
  final String courseId;
  final String courseName;

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
    bool isTablet = MediaQuery.of(context).size.width >= 600;
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
                  ? Center(
                      child: Text('Yah, Paket tidak tersedia'),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 153 / 96,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 12,
                      ),
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
