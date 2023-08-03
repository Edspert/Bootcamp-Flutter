import 'package:elearning/data/model/exercise_result.dart';
import 'package:elearning/data/model/question_list_response.dart';
import 'package:elearning/data/repository/course_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/question_answer.dart';
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
    Future.delayed(Duration(milliseconds: 100)).then((value) async {
      await getQuestions();
    });
  }

  /// Questions
  List<QuestionListData> questionList = [];

  /// Get Dari API Get Questions
  Future<void> getQuestions() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<QuestionListData> result = await courseRepository.getQuestions(exerciseId: exerciseId, email: email);
      questionList = result;
      if (questionList.isNotEmpty) {
        // Init jawaban yang sudah diisi
        _initStudentAnsweredQuestions();

        // Set soal aktif ke nomor 1
        activeQuestionId = questionList.first.questionId!;
      }
      update();
    }
  }

  void _initStudentAnsweredQuestions() {
    for (QuestionListData data in questionList) {
      if (data.studentAnswer != null) {
        if (questionAnswers.any((element) => element.questionId == data.questionId)) {
          int indexToUpdate = questionAnswers.indexWhere((element) => element.questionId == data.questionId);
          questionAnswers[indexToUpdate] = QuestionAnswer(questionId: data.questionId!, answer: data.studentAnswer!);
        } else {
          questionAnswers.add(QuestionAnswer(questionId: data.questionId!, answer: data.studentAnswer!));
        }
        update();
      }
    }
  }

  /// Answers
  List<QuestionAnswer> questionAnswers = List.empty(growable: true); // []
  int activeQuestionIndex = 0;
  String activeQuestionId = '';
  bool submitAnswerLoading = false;

  void navigateToQuestionIndex(int index) {
    activeQuestionIndex = index;
    try {
      activeQuestionId = questionList[activeQuestionIndex].questionId ?? '';
    } catch (e) {
      // Ignore
    }
    update();
  }

  void updateAnswerToQuestion({required String questionId, required String answer}) {
    /// Check dulu, apakah jawabannya ada?
    if (questionAnswers.any((element) => element.questionId == questionId)) {
      int indexToUpdate = questionAnswers.indexWhere((element) => element.questionId == questionId);
      questionAnswers[indexToUpdate] = QuestionAnswer(questionId: questionId, answer: answer);
    } else {
      print('question: $questionId');
      questionAnswers.add(QuestionAnswer(questionId: questionId, answer: answer));
    }
    update();
  }

  Future<void> submitAnswers() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      submitAnswerLoading = true;
      update();

      if (questionAnswers.length == 10) {
        List<String> questionIds = questionAnswers.map((element) => element.questionId).toList();
        // ["Q1", "Q2", ....]
        List<String> answers = questionAnswers.map((e) => e.answer).toList();
        // ["A", "C", ....]

        /// Submit Answer API Call
        bool submitAnswersResult = await courseRepository.submitAnswers(
          email: email,
          exerciseId: exerciseId,
          questionIds: questionIds,
          answers: answers,
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
      } else {
        Get.snackbar('Semua harus diisi!', 'Periksa kembali jawaban anda.', snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
