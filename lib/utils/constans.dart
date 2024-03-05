import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double getScreenHeight(BuildContext context) {
  // print(MediaQuery.of(context).size.height.toString());
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// const String logo = 'assets/images/logo.png';
// const String imgLogo = 'assets/images/logo.png';
// const String changeProfile = 'assets/images/add_pic_icon.png';
// const String trophyImage = 'assets/images/trophy.png';
// const String quizBook = 'assets/images/quiz_book.png';
//common colors
const Color goldColor = Color.fromARGB(255, 221, 133, 96);
const Color greyColor = Colors.grey;
const Color feedbackEmojiColor = Color(0xFFe9dcff);
const Color whiteColor = Colors.white;
const Color purpleColor = Color(0xFF6c33d1);
const Color falseAnsColor = Color(0xFFffc4c4);
const Color trueAnsColor = Color(0xFFc8ffe3);
const Color resultTrueColor = Color(0xFF2BBE73);
const Color resultFalseColor = Color(0xFFC43131);
const Color blackColor = Colors.black;
const Color redColor = Colors.red;

final mobileNumberFormater = FilteringTextInputFormatter.allow(RegExp('[0-9]'));

final LengthLimitingTextInputFormatter mobileLengthFormatter =
    LengthLimitingTextInputFormatter(10);
    final LengthLimitingTextInputFormatter zipCodeLengthFormatter =
    LengthLimitingTextInputFormatter(6);
    final mobileNumberFormat = FilteringTextInputFormatter.allow(RegExp('[0-9]'));


final LengthLimitingTextInputFormatter otpFormatter =
    LengthLimitingTextInputFormatter(6);
