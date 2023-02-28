import 'package:elearning/data/model/question_list_response.dart';
import 'package:elearning/presentation/exercise/questions_form/exercise_questions_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseQuestionsFormPage extends StatelessWidget {
  const ExerciseQuestionsFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Soal'),
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
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    questions.length,
                    (index) => IconButton(
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
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(18),
                  children: [
                    // Judul/Pertanyaan Soal
                    Text(activeQuestion.questionTitle ?? ''),

                    // Opsi Jawaban
                    RadioListTile(
                      title: Text(activeQuestion.optionA ?? ''),
                      value: 'A',
                      groupValue: selectedAnswer,
                      onChanged: (val) {
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
