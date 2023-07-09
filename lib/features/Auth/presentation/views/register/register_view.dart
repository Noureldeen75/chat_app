import 'package:chat_app/features/Auth/presentation/views/login/widgets/login_view_body.dart';
import 'package:chat_app/features/Auth/presentation/views/register/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RegisterViewBody(),
    );
  }
}
