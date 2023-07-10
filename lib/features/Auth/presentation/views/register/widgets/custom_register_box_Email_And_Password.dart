import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_email_register_next_button.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_box_top_toggle_bar.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterBoxEmailAndPassword extends StatelessWidget {
  const CustomRegisterBoxEmailAndPassword({super.key});

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
        CustomAuthTextField(
          label: 'Email',
          prefixIconDate: Icons.person,
          controller: AuthCubit.get(context).emailController,
        ),
        Spacer(
          flex: 2,
        ),
        CustomAuthTextField(
          label: 'Password',
          prefixIconDate: Icons.lock,
          controller: AuthCubit.get(context).passwordController,
        ),
        Spacer(
          flex: 2,
        ),
        CustomAuthTextField(
          label: 'Confirm Password',
          prefixIconDate: Icons.check,
          controller: AuthCubit.get(context).confirmPasswordController,
        ),
        Spacer(
          flex: 4,
        ),
        if (AuthCubit.get(context).isUserCreatedWithEmail)
          CustomEmailRegisterNextButton(),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
