import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterBoxUserInfoContent extends StatelessWidget {
  const CustomRegisterBoxUserInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Text(
          "Register to continue..",
          style: TextStyles.textSize20.copyWith(color: ColorsClass.mainBlue),
        ),
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
        if (AuthCubit.get(context).isUserCreated)
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: InkWell(
                onTap: AuthCubit.get(context).toggRegisterleBoxContent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorsClass.mainBlue,
                    boxShadow: [
                      BoxShadow(
                        color: ColorsClass.shadowColor,
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    "Next",
                    style: TextStyles.textSize20.copyWith(color: Colors.white),
                  ),
                )),
          ),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
