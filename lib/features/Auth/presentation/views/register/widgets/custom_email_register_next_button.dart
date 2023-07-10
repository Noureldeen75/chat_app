import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomEmailRegisterNextButton extends StatelessWidget {
  const CustomEmailRegisterNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
          onTap: AuthCubit.get(context).toggleEmailRegistrationStepsBoxContent,
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
    );
  }
}
