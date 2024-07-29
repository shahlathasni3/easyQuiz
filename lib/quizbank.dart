import 'question.dart';

class QuizBank {
  int _QuestioNumber = 0;
  List<Question> _questionBank = [
    Question(q: 'Sharks are mammal.', a: false),
    Question(q: 'Sea otters have a favorite rock they use to break open food.', a: true),
    Question(q: 'The blue whale is the biggest animal to have ever lived.', a: true),
    Question(q: 'The hummingbird egg is the world\'s smallest bird egg.', a: true),
    Question(q: 'Pigs roll in the mud because they don\'t like being clean.', a: false),
    Question(q: 'Bats are blind.', a: false),
  ];

  void nextQuestion() {
    if(_QuestioNumber < _questionBank.length - 1) {
      _QuestioNumber++;
      print(_QuestioNumber);
      print(_questionBank.length);
    }
  }
  String getQuestionText() {
    return _questionBank[_QuestioNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_QuestioNumber].questionAnswer;
  }

  bool isFinished() {
    if(_QuestioNumber == _questionBank.length-1) {
      return true;
    }
    else{
      return false;
    }
  }

  void reset() {
    _QuestioNumber = 0;
  }
}