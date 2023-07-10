import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_email_register_next_button.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_phone_number_register_next_button.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_box_top_toggle_bar.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterBoxPhoneNumber extends StatelessWidget {
  const CustomRegisterBoxPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 15.0,
        ),
        CustomRegisterBoxTopToggleBar(),
        Spacer(
          flex: 2,
        ),
        Row(
          children: [
            Expanded(
              child: CustomAuthTextField(
                label: 'User name',
                prefixIconDate: Icons.person,
                controller: AuthCubit.get(context).userNameController,
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: CustomAuthTextField(
                label: 'Age',
                prefixIconDate: Icons.person,
                controller: AuthCubit.get(context).ageController,
              ),
            ),
          ],
        ),
        Spacer(
          flex: 2,
        ),
        Text(
          "Enter your phone number..",
          style: TextStyles.textSize20.copyWith(color: ColorsClass.mainBlue),
        ),
        SizedBox(
          height: 10.0,
        ),
        CustomAuthTextField(
            label: 'Number',
            prefixIconDate: Icons.numbers,
            controller: AuthCubit.get(context).phoneNumberController,
            keyboardType: TextInputType.number),
        Spacer(
          flex: 4,
        ),
        if (AuthCubit.get(context).isPhoneNumberGiven)
          CustomPhoneNumberRegisterNextButton(),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
