import 'package:elearning/data/model/exercise_result.dart';
import 'package:elearning/data/model/question_list_response.dart';
import 'package:elearning/data/repository/course_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class ExerciseQuestionsFormController extends GetxController {
  final CourseRepository courseRepository;
  final FirebaseAuthService firebaseAuthService;

  ExerciseQuestionsFormController(this.courseRepository, this.firebaseAuthService);

  // Currently set to static
  late String exerciseId;

  @override
  void onInit() {
    super.onInit();

    exerciseId = Get.arguments as String;
    getQuestions();
  }

  /// Questions
  List<QuestionListData> questionList = [];

  Future<void> getQuestions() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<QuestionListData> result = await courseRepository.getQuestions(exerciseId: exerciseId, email: email);
      questionList = result;
      update();
    }
  }

  /// Answers
  List<QuestionAnswer> questionAnswers = [];
  int activeQuestionIndex = 0;
  String activeQuestionId = '';
  String selectedAnswer = '';
  bool submitAnswerLoading = false;

  void navigateToQuestionIndex(int index) {
    activeQuestionIndex = index;
    try {
      activeQuestionId = questionList.elementAt(activeQuestionIndex).questionId ?? '';
    } catch (e) {
      // Ignore
    }
    update();
  }

  void updateAnswerToQuestion({required String questionId, required String answer}) {
    if (questionAnswers.any((e) => e.questionId == questionId)) {
      int indexToUpdate = questionAnswers.indexWhere((e) => e.questionId == questionId);
      questionAnswers[indexToUpdate] = QuestionAnswer(questionId: questionId, answer: answer);
    } else {
      questionAnswers.add(QuestionAnswer(questionId: questionId, answer: answer));
    }
    selectedAnswer = questionAnswers.firstWhereOrNull((e) => e.questionId == activeQuestionId)?.answer ?? '';
    update();
  }

  Future<void> submitAnswers() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      submitAnswerLoading = true;
      update();
      List<String> questionIds = questionAnswers.map((e) => e.questionId).toList();
      List<String> answers = questionAnswers.map((e) => e.answer).toList();

      /// Submit Answer API Call
      bool submitAnswersResult = await courseRepository.submitAnswers(
        exerciseId: exerciseId,
        questionIds: questionIds,
        answers: answers,
        email: email,
      );

      if (submitAnswersResult == true) {
        /// Get Exercise Result API Call
        ExerciseResultData? exerciseResult =
            await courseRepository.getExerciseResult(exerciseId: exerciseId, email: email);
        if (exerciseResult != null) {
          Get.offNamed(Routes.exerciseResult, arguments: exerciseResult.result?.jumlahScore ?? "0");
        }
      }
      submitAnswerLoading = false;
      update();
    }
  }
}

class QuestionAnswer {
  final String questionId;
  final String answer;

  @override
  String toString() {
    return 'QuestionAnswer{questionId: $questionId, answer: $answer}';
  }

  QuestionAnswer({required this.questionId, required this.answer});
}
