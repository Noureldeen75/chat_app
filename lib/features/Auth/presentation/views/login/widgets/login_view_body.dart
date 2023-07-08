import 'package:chat_app/core/Functions/device_info.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/core/widgets/custom_background.dart';
import 'package:chat_app/features/Auth/presentation/views/login/widgets/custom_login_background.dart';
import 'package:chat_app/features/Auth/presentation/views/login/widgets/custom_login_box_info.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLoginBackground(
      child: Column(
        children: [
          Spacer(),
          Text(
            "WhyApp",
            style: TextStyles.textSize30
                .copyWith(color: Color.fromARGB(255, 182, 167, 30)),
          ),
          Spacer(
            flex: 4,
          ),
          CustomLoginBoxInfo(),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
