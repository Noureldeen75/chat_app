import 'package:chat_app/core/Functions/device_info.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:flutter/material.dart';

class CustomAuthBackground extends StatelessWidget {
  const CustomAuthBackground({required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context),
      width: deviceWidth(context),
      decoration: BoxDecoration(gradient: ColorsClass.backgroundGradient),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: deviceHeight(context) * 0.5,
            width: double.infinity,
            color: ColorsClass.mainBlue,
          ),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}
