import 'package:elearning/data/model/question_list_response.dart';
import 'package:elearning/presentation/exercise/questions_form/exercise_questions_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseQuestionsFormPage extends StatelessWidget {
  const ExerciseQuestionsFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseQuestionsFormController>(
      builder: (controller) {
        List<QuestionListData> questions = controller.questionList;

        int activeQuestionIndex = controller.activeQuestionIndex;
        String activeQuestionId = '';
        try {
          activeQuestionId = questions.elementAt(activeQuestionIndex).questionId ?? '';
        } catch (e) {
          // Ignore
        }
        String selectedAnswer =
            controller.questionAnswers.firstWhereOrNull((e) => e.questionId == activeQuestionId)?.answer ?? '';

        print('activeQuestionId: $activeQuestionId');
        print('selectedAnswer: $selectedAnswer');

        return Scaffold(
          appBar: AppBar(
            title: Text('Latihan Soal'),
          ),
          body: questions.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: questions.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => IconButton(
                          icon: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontWeight: index == activeQuestionIndex ? FontWeight.w800 : FontWeight.w400,
                              color: index == activeQuestionIndex ? Colors.blue : Colors.black,
                            ),
                          ),
                          onPressed: () {
                            controller.navigateToQuestionIndex(index);
                          },
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(questions[activeQuestionIndex].questionTitle ?? ''),
                        RadioListTile(
                          title: Text(questions[activeQuestionIndex].optionA ?? ''),
                          value: 'A',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            print('Selected A!');

                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'A');
                          },
                        ),
                        RadioListTile(
                          title: Text(questions[activeQuestionIndex].optionB ?? ''),
                          value: 'B',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'B');
                          },
                        ),
                        RadioListTile(
                          title: Text(questions[activeQuestionIndex].optionC ?? ''),
                          value: 'C',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'C');
                          },
                        ),
                        RadioListTile(
                          title: Text(questions[activeQuestionIndex].optionD ?? ''),
                          value: 'D',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'D');
                          },
                        ),
                        RadioListTile(
                          title: Text(questions[activeQuestionIndex].optionD ?? ''),
                          value: 'E',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'E');
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.navigateToQuestionIndex(activeQuestionIndex + 1);
                      },
                      child: Text('Selanjutnya'),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
