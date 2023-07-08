import 'package:chat_app/core/Functions/device_info.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAuthBoxInfo extends StatelessWidget {
  const CustomAuthBoxInfo({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: child);
  }
}
