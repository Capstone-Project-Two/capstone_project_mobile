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
    answers: [
      'Female',
      'Male',
    ],
  ),
  MindCheckupQuestion(
    number: '2.',
    text: 'What is your occupation?',
    answers: [
      'Corporate',
      'Student',
      'Business',
      'Housewife',
      'Others',
    ],
  ),
  MindCheckupQuestion(
    number: '3.',
    text: 'Are you self-employed?',
    answers: [
      'Yes',
      'No',
    ],
  ),
  MindCheckupQuestion(
    number: '4.',
    text: 'Do you have a family history of mental health issues?',
    answers: [
      'Yes',
      'No',
    ],
  ),
  MindCheckupQuestion(
    number: '5.',
    text: 'Are you currently undergoing any treatment for mental health?',
    answers: [
      'Yes',
      'No',
    ],
  ),
  MindCheckupQuestion(
    number: '6.',
    text: 'How many days have you spent indoors without going outside?',
    answers: [
      '1-14 days',
      '15-30 days',
      '31-60 days',
      'More than 2 months',
      'Go out every day',
    ],
  ),
  MindCheckupQuestion(
    number: '7.',
    text: 'Are you experiencing growing stress?',
    answers: [
      'Yes',
      'No',
      'Maybe',
    ],
  ),
  MindCheckupQuestion(
    number: '8.',
    text: 'Have you noticed any changes in your habits recently?',
    answers: [
      'Yes',
      'No',
      'Maybe',
    ],
  ),
  MindCheckupQuestion(
    number: '9.',
    text: 'How would you describe your mood swings?',
    answers: [
      'Medium',
      'Low',
      'High',
    ],
  ),
  MindCheckupQuestion(
    number: '10.',
    text: 'Are you struggling to cope with daily activities?',
    answers: [
      'Yes',
      'No',
    ],
  ),
  MindCheckupQuestion(
    number: '11.',
    text: 'Are you interested in your work?',
    answers: [
      'Yes',
      'No',
      'Maybe',
    ],
  ),
  MindCheckupQuestion(
    number: '12.',
    text: 'Do you feel socially weak or isolated?',
    answers: [
      'Yes',
      'No',
      'Maybe',
    ],
  ),
  MindCheckupQuestion(
    number: '13.',
    text: 'Have you ever had an interview session about your mental health?',
    answers: [
      'Yes',
      'No',
      'Maybe',
    ],
  ),
  MindCheckupQuestion(
    number: '14.',
    text: 'Are you aware of the available care options for mental health?',
    answers: [
      'Yes',
      'No',
      'Not sure',
    ],
  ),
];
