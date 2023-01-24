class QuestionAnswer {
  final String questionId;
  final String answer;

  @override
  String toString() {
    return 'QuestionAnswer{questionId: $questionId, answer: $answer}';
  }

  /// [("1", "A"),  ("2", "B"), ("3", "C"), ("5", "D"), ("4", "D")]

  QuestionAnswer({required this.questionId, required this.answer});
}