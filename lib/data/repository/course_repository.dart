import 'package:elearning/data/model/course_response.dart';
import 'package:elearning/data/model/exercise_list_response.dart';
import 'package:elearning/data/model/exercise_result.dart';
import 'package:elearning/data/model/question_list_response.dart';
import 'package:flutter/foundation.dart';

import '../../core/values/urls.dart';
import '../services/dio_client.dart';

abstract class CourseRepository {
  Future<List<CourseData>> getCourses(
      {required String majorName, required String email});

  Future<List<ExerciseListData>> getExercisesByCourse(
      {required String courseId, required String email});

  Future<List<QuestionListData>> getQuestions(
      {required String exerciseId, required String email});

  Future<bool> submitAnswers({
    required String exerciseId,
    required List<String> questionIds,
    required List<String> answers,
    required String email,
  });

  Future<ExerciseResultData?> getExerciseResult(
      {required String exerciseId, required String email});
}

class CourseRepositoryImpl implements CourseRepository {
  final DioClient dioClient;

  CourseRepositoryImpl(this.dioClient);

  @override
  Future<List<CourseData>> getCourses(
      {required String majorName, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.courseList,
        queryParameters: {
          "major_name": majorName,
          "user_email": email,
        },
      );

      CourseResponse res = CourseResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getCourses: $e, $stackTrace');
      }
      return [];
    }
  }

  @override
  Future<ExerciseResultData?> getExerciseResult(
      {required String exerciseId, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.exerciseResult,
        queryParameters: {
          "exercise_id": exerciseId,
          "user_email": email,
        },
      );

      ExerciseResultResponse res = ExerciseResultResponse.fromJson(result);
      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getExerciseResult: $e, $stackTrace');
      }
      return null;
    }
  }

  @override
  Future<List<ExerciseListData>> getExercisesByCourse(
      {required String courseId, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.exerciseList,
        queryParameters: {
          "course_id": courseId,
          "user_email": email,
        },
      );

      ExerciseListResponse res = ExerciseListResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getExercisesByCourse: $e, $stackTrace');
      }
      return [];
    }
  }

  @override
  Future<List<QuestionListData>> getQuestions(
      {required String exerciseId, required String email}) async {
    try {
      final result = await dioClient.post(
        Urls.exerciseQuestionsList,
        body: {
          "exercise_id": exerciseId,
          "user_email": email,
        },
      );

      QuestionListResponse res = QuestionListResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getQuestions: $e, $stackTrace');
      }
      return [];
    }
  }

  @override
  Future<bool> submitAnswers(
      {required String exerciseId,
      required List<String> questionIds,
      required List<String> answers,
      required String email}) async {
    try {
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err submitAnswers: $e, $stackTrace');
      }
      return false;
    }
  }
}
