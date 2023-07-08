import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          Text("WhyApp", style: TextStyles.textSize30,)
        ],
      ),
    );
  }
}