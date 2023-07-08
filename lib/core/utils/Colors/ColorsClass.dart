import 'package:flutter/material.dart';

abstract class ColorsClass {
  static const mainBlue = Color(0xFF0E4D92);
  static const blue1 = Color(0xFFE3F2FD);
  static const blue2 = Color(0xFFBBDEFB);

  static const shadowColor = Color.fromARGB(255, 104, 116, 131);

  static const backgroundGradient = LinearGradient(
      begin: AlignmentDirectional.topEnd,
      end: AlignmentDirectional.bottomStart,
      colors: [blue1, blue2]);
}
