import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterBoxTopToggleBar extends StatelessWidget {
  const CustomRegisterBoxTopToggleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Register with..",
          style: TextStyles.textSize20.copyWith(color: ColorsClass.mainBlue),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            AuthCubit.get(context)
                .toggleWithEmailOrNumberBoxContent(registerType: "Email");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AuthCubit.get(context).toggleEmailOrNumberBoxContent
                    ? ColorsClass.mainBlue
                    : ColorsClass.shadowColor),
            child: Text(
              "Email",
              style: TextStyles.textSize16.copyWith(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        InkWell(
          onTap: () {
            AuthCubit.get(context)
                .toggleWithEmailOrNumberBoxContent(registerType: "Number");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: !AuthCubit.get(context).toggleEmailOrNumberBoxContent
                    ? ColorsClass.mainBlue
                    : ColorsClass.shadowColor),
            child: Text(
              "Number",
              style: TextStyles.textSize16.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
