class Question {
  // Lúc tạo Class, flutter yêu cầu phải init các property
  // cho nên có vài cách:
  // 1- gán giá trị init (questionText = '')
  // 2- thêm keyword late trước property (late String questionText)
  // 3- thêm ? ngay sau date type (String? questionText)
  String questionText;
  bool questionAnswer;

  Question({required this.questionText, required this.questionAnswer});
}
