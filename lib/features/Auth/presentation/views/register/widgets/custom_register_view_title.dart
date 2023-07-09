import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterViewTitle extends StatelessWidget {
  const CustomRegisterViewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "You Can ",
              style: TextStyles.textSize35
                  .copyWith(color: Color.fromARGB(255, 202, 186, 47)),
            )),
        Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              "Join Now",
              style: TextStyles.textSize35
                  .copyWith(color: Color.fromARGB(255, 202, 186, 47)),
            )),
      ],
    );
  }
}
