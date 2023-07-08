import 'package:flutter/material.dart';

abstract class ColorsClass {
  static const blue1 = Color(0xFFE3F2FD);
  static const blue2 = Color(0xFFBBDEFB);

  static const backgroundGradient = LinearGradient(
      begin: AlignmentDirectional.topEnd,
      end: AlignmentDirectional.bottomStart,
      colors: [blue1, blue2]);
}
