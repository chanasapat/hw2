import 'dart:math';

class Game {
  int answer = 0; // instance field
  var count = 1;


  Game({int? maxRandom}) {

    if (maxRandom == null){
      maxRandom = 100;
    }

    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
    //print('คำตอบคือ $answer');
  }

  int doGuess(int num) {
    if (num > answer){
      print('║ ➜ $num is Too High! ▲');
      print('╟──────────────────────────────────────────────');
      count++;
      return 0;

    } else if (num < answer){
      print('║ ➜ $num is Too Low! ▼');
      print('╟──────────────────────────────────────────────');
      count++;
      return 0;

    } else {
      print('║ ➜ $num is Correct ❤, total guesses: $count');
      print('╟──────────────────────────────────────────────');
      print('║                   THE END');
      print('╚═══════════════════════════════════════════════');
      return 1;
    }
  }
}