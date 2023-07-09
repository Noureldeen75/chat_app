import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
import 'package:chat_app/features/Auth/presentation/views/login/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: LoginViewBody(),
          );
        });
  }
}
