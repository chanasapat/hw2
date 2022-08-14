import 'dart:io';
import 'game.dart';

void main() {
  int result = 0;
  int numBreak = 0;
  int count = 0;
  var myList = <int>[];
  var play = "";

  do {
    stdout.write('Enter a maximum number to random: ');
    var mRandom = stdin.readLineSync();
    var maxRandom = int.tryParse(mRandom!);

    var game = Game(maxRandom: maxRandom);

    print('╔══════════════════════════════════════════════');
    print('║              GUESS THE NUMBER');
    print('╟──────────────────────────────────────────────');

    do {
      if (maxRandom == null){
        stdout.write('║ Guess the number between 1 and 100: ');
      } else {
        stdout.write('║ Guess the number between 1 and $maxRandom: ');
      }

      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess == null){
        //print('Please enter number only');
        count--;
        continue;
      }

      result = game.doGuess(guess);
      count++;

    } while (result != 1);

    myList.add(count);
    count = 0;

    do {
      stdout.write('Play again? (Y/N): ');
      var play = stdin.readLineSync();

      if (play == "n" || play == "N"){
        numBreak = 2;

      } else if (play == "y" || play == "Y"){
        numBreak = 1;

      } else {
        numBreak = 0;
      }

    } while (numBreak < 1);

  } while (numBreak != 2);

  var len = myList.length;
  print("You've played $len games");

  for (var i = 0; i < len; i++) {
    print('🚀 Game #${i+1}: ${myList[i]} guesses');
  }


}
