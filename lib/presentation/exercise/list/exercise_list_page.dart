import 'package:elearning/presentation/exercise/list/exercise_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/exercise_list_response.dart';
import '../../../routes/routes.dart';

class ExerciseListPageArgs {
  final String courseId;
  final String courseName;

  const ExerciseListPageArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListPage extends StatelessWidget {
  const ExerciseListPage({Key? key}) : super(key: key);

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
              : ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(exercises[index].exerciseTitle ?? ''),
                      onTap: () {
                        Get.toNamed(Routes.exerciseQuestionsForm, arguments: exercises[index].exerciseId);
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
