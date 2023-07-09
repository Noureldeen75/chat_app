import 'package:chat_app/core/functions/navigation/animated_navigation.dart';
import 'package:flutter/material.dart';

void NavigatorPush(BuildContext context, Widget screen) {
  Navigator.push(
      context, FlipPageRoute(builder: (context) => screen));
}
