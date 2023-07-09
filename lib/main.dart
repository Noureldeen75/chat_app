import 'package:chat_app/core/cubits/BlocOpserver/BlocOpserver.dart';
import 'package:chat_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/core/cubits/main_cubit/main_cubit.dart';
import 'package:chat_app/core/cubits/main_cubit/main_states.dart';
import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/features/Auth/presentation/views/login/login_view.dart';
import 'package:chat_app/features/Auth/presentation/views/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (context) => MainCubit(),),
         BlocProvider(create: (context) => AuthCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          primaryColor: ColorsClass.mainBlue,
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: RegisterView(),
      ),
    );
  }
}
