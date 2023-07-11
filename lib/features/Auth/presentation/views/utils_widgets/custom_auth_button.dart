import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(10),
              color: ColorsClass.blue1,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ColorsClass.shadowColor,
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: Offset(0.2, 2),
                ),
              ],
            ),
            child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topEnd,
                      end: AlignmentDirectional.topStart,
                      colors: [
                        Color.fromARGB(255, 56, 149, 248),
                        ColorsClass.mainBlue,
                      ]),
                  //   borderRadius: BorderRadius.circular(5.0),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: ColorsClass.shadowColor,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0.2, 2),
                    ),
                  ],
                ),
                child: ConditionalBuilder(
                  condition: state is AuthEmailSignInLoadingState ||
                      state is AuthSignUpLoadingState ||
                      state is AuthEmailVerticationLoadingState ||
                      state is AuthPhoneNumberSignInLoadingState,
                  builder: (context) => Center(
                      child: CircularProgressIndicator(
                    color: ColorsClass.blue1,
                  )),
                  fallback: (context) => Icon(
                    Icons.arrow_forward,
                    color: ColorsClass.blue1,
                  ),
                )),
          ),
        );
      },
    );
  }
}
