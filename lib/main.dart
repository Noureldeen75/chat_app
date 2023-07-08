import 'package:chat_app/core/widgets/custom_background.dart';
import 'package:chat_app/features/Auth/presentation/views/login/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: LoginView(),
    );
  }
}
