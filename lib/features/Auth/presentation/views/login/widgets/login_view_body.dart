import 'package:chat_app/core/Functions/device_info.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/core/widgets/custom_background.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_background.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_box_info.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthBackground(
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
          CustomAuthBoxInfo(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                children: [
                  CustomAuthTextField(
                    label: 'Email',
                    prefixIconDate: Icons.person,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomAuthTextField(
                    label: 'Password',
                    prefixIconDate: Icons.lock,
                  ),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
