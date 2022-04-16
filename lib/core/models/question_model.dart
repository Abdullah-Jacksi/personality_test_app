

class QuestionModel {
  QuestionModel({
    required this.question,
    required this.answers,
  });

  String question;
  List<String>? answers;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    question: json["question"] ?? "null",
    answers: json["answers"] == null ? null : List<String>.from(json["answers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "question": question ?? "null",
    "answers": answers == null ? null : List<dynamic>.from(answers!.map((x) => x)),
  };
}
