import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_resending_code_counter.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterResendingCodeBar extends StatelessWidget {
  const CustomRegisterResendingCodeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomRegisterResendingCodeCounter(),
              ),
              SizedBox(
                width: 15.0,
              ),
              InkWell(
                  onTap: AuthCubit.get(context).isSmsCodeVericationResent
                      ? AuthCubit.get(context).resendSmsCode
                      : () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AuthCubit.get(context).isSmsCodeVericationResent
                            ? ColorsClass.mainBlue
                            : Color.fromARGB(255, 125, 132, 141)),
                    child: Text(
                      "Rsend the code",
                      style:
                          TextStyles.textSize16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
