import 'package:chat_app/core/functions/device_info.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_facebook_google.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAuthDownSection extends StatelessWidget {
  const CustomAuthDownSection({super.key, required this.isLogin, required this.onTap});

  final bool isLogin;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context) * 0.2,
      child: Column(
        children: [
          Spacer(),
          RichText(
              text: TextSpan(
                  text: isLogin
                      ? "Don't have an account? "
                      : "Already have an account? ",
                  style: TextStyles.textSize20.copyWith(color: Colors.black),
                  children: [
                TextSpan(
                    text: isLogin ? "Sign Up" : "Sign In",
                    recognizer: TapGestureRecognizer()..onTap = onTap,
                    style: TextStyles.textSize20
                        .copyWith(color: ColorsClass.mainBlue)),
              ])),
          Spacer(),
          Text("OR",
              style: TextStyles.textSize20.copyWith(color: Colors.black)),
          Spacer(),
          CustomAuthFacebookGoogle(),
          Spacer(),
        ],
      ),
    );
  }
}
