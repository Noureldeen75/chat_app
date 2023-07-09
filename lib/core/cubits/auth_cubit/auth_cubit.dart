import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
import 'package:chat_app/core/functions/showing_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool isEmailVericationSent = false;
  bool isUserCreated = false;
  bool isBoxVerticationContent = false;

  void toggRegisterleBoxContent() {
    isBoxVerticationContent = !isBoxVerticationContent;
    emit(AuthRegisterToggleBoxInfoConState());
  }

  void signIn() async {
    emit(AuthSignInLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        showToast("Logined Successfully", true);
        emit(AuthSignInSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found", false);
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password", false);
      }
      emit(AuthSignInErrorState());
    }catch (e) {
      print(e);
      showToast(e.toString(), false);
      emit(AuthSignInErrorState());
    }
  }

  void signUp() async {
    emit(AuthSignUpLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        isUserCreated = true;
        isBoxVerticationContent = true;
        emit(AuthSignUpSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast("Weak password", false);
      } else if (e.code == 'email-already-in-use') {
        showToast("The account is already exist", false);
      }
      emit(AuthSignUpErrorState());
    } catch (e) {
      print(e);
      showToast(e.toString(), false);
      emit(AuthSignUpErrorState());
    }
  }

  void sendEmailVertication() async {
    emit(AuthSendingEmailVerticationLoadingState());
    var user = FirebaseAuth.instance.currentUser;
    try {
      await user?.sendEmailVerification().then((value) {
        isEmailVericationSent = true;
        showToast("We sent a link for your email", true);
        emit(AuthSendingEmailVerticationSuccessState());
      });
    } on Exception catch (e) {
      print(e);
      showToast(e.toString(), false);
      emit(AuthSendingEmailVerticationErrorState());
    }
  }

  Future<bool> emailVertication() async {
    emit(AuthEmailVerticationLoadingState());
    var user = FirebaseAuth.instance.currentUser;
    try {
      await user
          ?.reload()
          .then((value) => emit(AuthEmailVerticationSuccessState()));
    } on Exception catch (e) {
      print(e);
      emit(AuthEmailVerticationErrorState());
    }
    return user!.emailVerified;
  }

  void deleteUserAccount() async {
    emit(AuthDeletingUserAccountLoadingState());
    try {
      var user = FirebaseAuth.instance.currentUser;
      await user?.delete().then((value) {
        showToast("user deleted", false);
        emit(AuthDeletingUserAccountSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      showToast('Failed to delete user account: ${e.message}', false);
      emit(AuthDeletingUserAccountErrorState());
    }
  }
}
