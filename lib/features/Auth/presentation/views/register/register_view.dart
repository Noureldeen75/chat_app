import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
import 'package:chat_app/features/Auth/presentation/views/login/widgets/login_view_body.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: RegisterViewBody(),
        );
      },
    );
  }
}
