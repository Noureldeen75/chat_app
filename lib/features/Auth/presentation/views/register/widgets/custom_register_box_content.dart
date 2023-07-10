import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_box_Email_And_Password.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_box_email_vertication.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_box_phone_number.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_box_phone_number_vertication.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/custom_register_email_vertication_bar.dart';
import 'package:chat_app/features/Auth/presentation/views/utils_widgets/custom_auth_text_field.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterBoxContent extends StatelessWidget {
  const CustomRegisterBoxContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if ((AuthCubit.get(context).isUserCreatedWithEmail &&
            (AuthCubit.get(context).toggleEmailRegistrationSteps))) {
          return CustomRegisterBoxEmailVertication();
        } else {
          if (AuthCubit.get(context).isPhoneNumberGiven &&
              AuthCubit.get(context).togglePhoneNumberRegistrationSteps) {
            return CustomRegisterBoxPhoneNumberVertication();
          } else {
            return ConditionalBuilder(
              condition: AuthCubit.get(context).toggleEmailOrNumberBoxContent,
              builder: (context) => CustomRegisterBoxEmailAndPassword(),
              fallback: (context) => CustomRegisterBoxPhoneNumber(),
            );
          }
        }
      },
    );
  }
}
