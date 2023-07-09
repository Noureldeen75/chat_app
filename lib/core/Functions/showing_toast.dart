import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  String message,
  bool condition,
) async {
  Color color;
  if (condition) {
    color = Color.fromARGB(255, 14, 55, 89);
  } else {
    color = Color.fromARGB(255, 84, 14, 10);
  }
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}