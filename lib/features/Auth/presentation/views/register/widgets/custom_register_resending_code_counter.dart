import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterResendingCodeCounter extends StatelessWidget {
  const CustomRegisterResendingCodeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      ringColor: ColorsClass.mainBlue,
      height: 30,
      width: 30,
      duration: 20,
      initialDuration: 0,
      fillColor: Color.fromARGB(255, 174, 179, 184),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      strokeWidth: 10.0,
      textStyle: TextStyles.textSize16.copyWith(color: Colors.white),
      isReverse: true,
      onComplete: () {
        AuthCubit.get(context).toggleIsSmsCodeVericationResent();
      },
    );
  }
}
