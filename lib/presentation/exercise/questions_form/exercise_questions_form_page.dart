import 'package:elearning/core/values/colors.dart';
import 'package:elearning/data/model/question_list_response.dart';
import 'package:elearning/presentation/exercise/questions_form/exercise_questions_form_controller.dart';
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
              Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    10,
                    (index) {
                      bool isAnswered = controller.questionAnswers.any(
                        (element) =>
                            element.questionId == questions[index].questionId && element.questionId == activeQuestionId,
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
                        child: Text(
                          'A. ${activeQuestion.optionA}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedAnswer == 'A' ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
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
                          Get.bottomSheet(
                            Wrap(
                              children: [
                                Column(
                                  children: [
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
                            backgroundColor: Colors.white,
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
