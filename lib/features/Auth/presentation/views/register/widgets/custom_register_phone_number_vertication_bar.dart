import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterPhoneNumberVerticationBar extends StatelessWidget {
  const CustomRegisterPhoneNumberVerticationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
          color: Color.fromARGB(255, 225, 212, 99),
          child: Row(
            children: [
              Icon(Icons.message),
              SizedBox(
                width: 7.0,
              ),
              Text("Number Vertication", style: TextStyles.textSize16),
              Spacer(),
              ConditionalBuilder(
                condition: state is! AuthSendingEmailVerticationLoadingState,
                builder: (context) =>
                    AuthCubit.get(context).isEmailVericationSent
                        ? Icon(Icons.check)
                        : InkWell(
                            onTap: AuthCubit.get(context).sendEmailVertication,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: ColorsClass.mainBlue),
                              child: Text(
                                "Send",
                                style: TextStyles.textSize16
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                fallback: (context) => SizedBox(
                    height: 22.0,
                    child: CircularProgressIndicator(
                      color: ColorsClass.mainBlue,
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
