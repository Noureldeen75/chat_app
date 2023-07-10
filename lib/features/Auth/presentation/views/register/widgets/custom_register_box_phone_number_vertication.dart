import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_phone_number_register_back_button.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_email_vertication_bar.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_phone_number_vertication_bar.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterBoxPhoneNumberVertication extends StatelessWidget {
  const CustomRegisterBoxPhoneNumberVertication({super.key});

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
        CustomRegisterPhoneNumberVerticationBar(),
        Spacer(),
        if (AuthCubit.get(context).isNumberVericationSent)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Please, Enter the code",
              style: TextStyles.textSize18.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        if (AuthCubit.get(context).isNumberVericationSent)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: CustomAuthTextField(
              label: "Code",
              prefixIconDate: Icons.numbers,
              controller: AuthCubit.get(context).numberCodeController,
              keyboardType: TextInputType.number,
            ),
          ),
        Spacer(
          flex: 3,
        ),
        CustomPhoneNumberRegisterBackButton(),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
