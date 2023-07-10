import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_email_register_back_button.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_email_vertication_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterBoxEmailVertication extends StatelessWidget {
  const CustomRegisterBoxEmailVertication({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "Register to continue..",
            style: TextStyles.textSize20.copyWith(color: ColorsClass.mainBlue),
          ),
        ),
        Spacer(),
        CustomRegisterEmailVerticationBar(),
        SizedBox(
          height: 5.0,
        ),
        if (AuthCubit.get(context).isEmailVericationSent)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Please, Follow the link that we sent",
              style: TextStyles.textSize18.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        Spacer(
          flex: 3,
        ),
        CustomEmailRegisterBackButton(),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
