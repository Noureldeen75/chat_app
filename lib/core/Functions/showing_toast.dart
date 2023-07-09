import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  String message,
  bool condition,
) async {
  Color color;
  if (condition) {
    color = Color.fromARGB(255, 103, 181, 245);
  } else {
    color = Color.fromARGB(255, 229, 78, 67);
  }
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.black,
      fontSize: 16.0);
}