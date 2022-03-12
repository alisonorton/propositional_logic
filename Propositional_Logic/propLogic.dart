//import 'dart:_internal';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main(args) {
  if (args.isEmpty) {
    stdout.write("ERROR: Please enter file name\n");
  } else {
    //Reading the file line by line
    new File(args[0].toString())
        .readAsLines()
        .then((List<String> lineContents) {
      //Parsing through each line of the file
      var words = new List();
      for (var i = 0; i < lineContents.length; i++) {
        //Splitting each line into words
        words = lineContents[i].split(' ');
        bool isStatement = false;

        //looping through each word
        for (var t = 0; t < words.length; t++) {
          //Confirming line is more than one word
          if (words.length == 1) {
            stdout.write("${lineContents[i]} NOT A STATEMENT\n");
            break;
          }
          //Checking for any pronouns or question words
          if ((words[t] == "how") ||
              (words[t] == "How") ||
              (words[t] == "what") ||
              (words[t] == "What") ||
              (words[t] == "where") ||
              (words[t] == "Where") ||
              (words[t] == "why") ||
              (words[t] == "Why") ||
              (words[t] == "who") ||
              (words[t] == "Who") ||
              (words[t] == "when") ||
              (words[t] == "When") ||
              (words[t] == "she") ||
              (words[t] == "She") ||
              (words[t] == "her") ||
              (words[t] == "Her") ||
              (words[t] == "he") ||
              (words[t] == "He") ||
              (words[t] == "his") ||
              (words[t] == "His") ||
              (words[t] == "it") ||
              (words[t] == "It") ||
              (words[t] == "they") ||
              (words[t] == "They")) {
            stdout.write("${lineContents[i]} NOT A STATEMENT\n");
            break;
          }
          //Checking for question marks
          if (lineContents[i].endsWith("?")) {
            stdout.write("${lineContents[i]} NOT A STATEMENT\n");
            break;
          }
          //Making sure we've checked each word in the line before leaving the loop
          if (t == words.length - 1) {
            isStatement = true;
          }
        }
        //Declaring if a line is a STATEMENT
        if (isStatement) {
          stdout.write("${lineContents[i]} STATEMENT\n");
          isStatement = false;
        }
      }
    });
  }
}
