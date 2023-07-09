import 'package:chat_app/core/functions/device_info.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context),
      width: deviceWidth(context),
      decoration: BoxDecoration(gradient: ColorsClass.backgroundGradient),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
