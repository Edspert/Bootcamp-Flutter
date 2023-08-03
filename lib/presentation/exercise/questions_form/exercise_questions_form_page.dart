import 'package:elearning/core/values/colors.dart';
import 'package:elearning/data/model/question_list_response.dart';
import 'package:elearning/presentation/exercise/questions_form/exercise_questions_form_controller.dart';
import 'package:elearning/presentation/exercise/questions_form/question_numbers_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class ExerciseQuestionsFormPage extends StatelessWidget {
  const ExerciseQuestionsFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Soal'),
        centerTitle: true,
      ),
      body: GetBuilder<ExerciseQuestionsFormController>(
        builder: (controller) {
          List<QuestionListData> questions = controller.questionList;
          int activeQuestionIndex = controller.activeQuestionIndex;
          if (questions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          QuestionListData activeQuestion = questions[activeQuestionIndex];
          String activeQuestionId = controller.activeQuestionId;
          String? selectedAnswer =
              controller.questionAnswers.firstWhereOrNull((e) => e.questionId == activeQuestionId)?.answer;

          print('questionAnswers: ${controller.questionAnswers.map((e) => '${e.questionId}-${e.answer}')}');

          return Column(
            children: [
              // Question Number Horizontal ListView
              QuestionNumbersBarWidget(
                questions: questions,
                activeQuestionId: activeQuestionId,
                controller: controller,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(18),
                  children: [
                    // Judul/Pertanyaan Soal
                    HtmlWidget(
                      activeQuestion.questionTitle ?? '',
                    ),
                    // Text(activeQuestion.questionTitle ?? ''),
                    // Opsi Jawaban
                    InkWell(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestionId,
                          answer: 'A',
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedAnswer == 'A' ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFD6D6D6),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'A.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedAnswer == 'A' ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: HtmlWidget(
                                activeQuestion.optionA ?? '',
                              ),
                            ),
                          ],
                        ),
                      ),
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
                      title: Text(activeQuestion.optionE ?? ''),
                      value: 'E',
                      groupValue: selectedAnswer,
                      onChanged: (val) {
                        controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'E');
                      },
                    ),

                    if (activeQuestionIndex < questions.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          controller.navigateToQuestionIndex(activeQuestionIndex + 1);
                        },
                        child: const Text('SELANJUTNYA'),
                      )
                    else
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                        onPressed: () {
                          Get.dialog(
                            Dialog(
                              child: Wrap(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 6,
                                        width: 89,
                                        color: Color(0xFFC4C4C4),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text('Kumpulkan latihan soal sekarang?'),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          const SizedBox(width: 32),
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Nanti Dulu'),
                                            ),
                                          ),
                                          const SizedBox(width: 32),
                                          Expanded(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                  controller.submitAnswers();
                                                },
                                                child: const Text('Ya')),
                                          ),
                                          const SizedBox(width: 32),
                                        ],
                                      ),
                                      const SizedBox(height: 32),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Text('KUMPULIN'),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
