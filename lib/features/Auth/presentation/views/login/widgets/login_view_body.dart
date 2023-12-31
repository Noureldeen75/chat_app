import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/cubits/main_cubit/main_cubit.dart';
import 'package:chat_app/core/functions/navigation/animated_navigation.dart';
import 'package:chat_app/core/functions/device_info.dart';
import 'package:chat_app/core/functions/navigation/navigator_push_replacement.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/core/widgets/custom_background.dart';
import 'package:chat_app/features/Auth/presentation/views/login/widgets/custom_login_box_info_content.dart';
import 'package:chat_app/features/Auth/presentation/views/login/widgets/custom_login_view_title.dart';
import 'package:chat_app/features/Auth/presentation/views/register/register_view.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_background.dart';
import 'package:chat_app/features/Auth/presentation/views/login/widgets/custom_login_box_info.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_button.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_down_section.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_text_field.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_facebook_google.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthBackground(
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: CustomLoginViewTitle(),
          ),
          PositionedDirectional(
            bottom: (deviceHeight(context) * 0.55 -
                deviceHeight(context) * 0.35 * 0.5),
            start: 0,
            end: 0,
            child: SizedBox(
              height: deviceHeight(context) * 0.35,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CustomLoginBoxInfo(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        child: CustomLoginBoxInfoContent()),
                  ),
                  Positioned(
                      bottom: -15,
                      child: CustomAuthButton(
                        onTap: () {
                          AuthCubit.get(context)
                              .signInWithEmailAndPassword(context);
                        },
                      ))
                ],
              ),
            ),
          ),
          PositionedDirectional(
              bottom: 30,
              start: 0,
              end: 0,
              child: CustomAuthDownSection(
                isLogin: true,
                onTap: () {
                  NavigatorPushReplacement(context, RegisterView());
                },
              )),
        ],
      ),
    );
  }
}
