import 'package:chat_app/core/functions/navigation/animated_navigation.dart';
import 'package:flutter/material.dart';

void NavigatorPushReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
      context, FlipPageRoute(builder: (context) => screen));
}
