import 'package:flutter/material.dart';

import '../../../core/values/colors.dart';
import '../../../data/model/question_list_response.dart';
import 'exercise_questions_form_controller.dart';

class QuestionNumbersBarWidget extends StatelessWidget {
  const QuestionNumbersBarWidget({
    super.key,
    required this.questions,
    required this.activeQuestionId,
    required this.controller,
  });

  final ExerciseQuestionsFormController controller;
  final List<QuestionListData> questions;
  final String activeQuestionId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          10,
          (index) {
            bool isAnswered = controller.questionAnswers.any(
              (element) => element.questionId == questions[index].questionId && element.questionId == activeQuestionId,
            );

            return InkWell(
              onTap: () {
                controller.navigateToQuestionIndex(index);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary,
                  ),
                  color: isAnswered ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontWeight: isAnswered ? FontWeight.w800 : FontWeight.w400,
                      color: isAnswered ? Colors.white : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
