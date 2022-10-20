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
        QuestionListData activeQuestion = questions[activeQuestionIndex];
        String activeQuestionId = controller.activeQuestionId;
        String selectedAnswer = controller.selectedAnswer;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Latihan Soal'),
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
                        Text(activeQuestion.questionTitle ?? ''),
                        RadioListTile(
                          title: Text(activeQuestion.optionA ?? ''),
                          value: 'A',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            print('Selected A!');

                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'A');
                          },
                        ),
                        RadioListTile(
                          title: Text(activeQuestion.optionB ?? ''),
                          value: 'B',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'B');
                          },
                        ),
                        RadioListTile(
                          title: Text(activeQuestion.optionC ?? ''),
                          value: 'C',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'C');
                          },
                        ),
                        RadioListTile(
                          title: Text(activeQuestion.optionD ?? ''),
                          value: 'D',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'D');
                          },
                        ),
                        RadioListTile(
                          title: Text(activeQuestion.optionD ?? ''),
                          value: 'E',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'E');
                          },
                        ),
                      ],
                    ),
                    if (activeQuestionIndex < 10)
                      ElevatedButton(
                        onPressed: () {
                          controller.navigateToQuestionIndex(activeQuestionIndex + 1);
                        },
                        child: const Text('Selanjutnya'),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          controller.submitAnswers();
                        },
                        child: const Text('Kumpulin'),
                      ),
                  ],
                ),
        );
      },
    );
  }
}
