class MindCheckupQuestion {
  final String number;
  final String text;
  final List<String> answers;

  MindCheckupQuestion({
    required this.number,
    required this.text,
    required this.answers,
  });
}

final List<MindCheckupQuestion> mindchekquestions = [
  MindCheckupQuestion(
    number: '1.',
    text: 'What is your gender?',
    answers: ['Female', 'Male'],
  ),
  MindCheckupQuestion(
    number: '2.',
    text: 'What is your occupation?',
    answers: ['Corporate', 'Student', 'Business', 'Housewife', 'Others'],
  ),
];
