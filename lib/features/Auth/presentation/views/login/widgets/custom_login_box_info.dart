import 'package:chat_app/core/functions/device_info.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomLoginBoxInfo extends StatelessWidget {
  const CustomLoginBoxInfo({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2.2,
      child: Container(
          margin: EdgeInsets.all(20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsClass.blue1,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: ColorsClass.shadowColor,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: child),
    );
  }
}
