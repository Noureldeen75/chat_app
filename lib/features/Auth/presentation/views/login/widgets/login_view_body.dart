import 'package:chat_app/core/Functions/device_info.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/core/widgets/custom_background.dart';
import 'package:chat_app/features/Auth/presentation/views/login/widgets/custom_login_view_title.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_background.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_box_info.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_button.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthBackground(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 20.0,
            left: 30.0,
            right: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLoginViewTitle(),
                Image.asset(
                  "assets/images/chat.png",
                  height: 50.0,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                CustomAuthBoxInfo(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Sign in to continue",
                          style: TextStyles.textSize18,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
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
                        SizedBox(
                          height: 60.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(bottom: -15, child: CustomAuthButton())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
