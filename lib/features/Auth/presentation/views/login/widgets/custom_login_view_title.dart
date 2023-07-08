import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomLoginViewTitle extends StatelessWidget {
  const CustomLoginViewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "Welcom ",
            style: TextStyles.textSize30
                .copyWith(color: Color.fromARGB(255, 182, 167, 30)),
            children: [
          TextSpan(
            text: "Back",
            style: TextStyles.textSize30.copyWith(
                color: Color.fromARGB(255, 182, 167, 30),
                fontWeight: FontWeight.w900),
          ),
        ]));
  }
}
