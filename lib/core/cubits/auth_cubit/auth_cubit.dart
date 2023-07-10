import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
import 'package:chat_app/core/functions/navigation/animated_navigation.dart';
import 'package:chat_app/core/functions/navigation/navigator_push_replacement.dart';
import 'package:chat_app/core/functions/showing_toast.dart';
import 'package:chat_app/features/Home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberCodeController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool isEmailVericationSent = false;
  bool isNumberVericationSent = false;

  bool toggleEmailOrNumberBoxContent = true;

  bool isUserCreatedWithEmail = false;
  bool toggleEmailRegistrationSteps = false;

  bool isPhoneNumberGiven = false;
  bool togglePhoneNumberRegistrationSteps = false;

  void toggleWithEmailOrNumberBoxContent({required String registerType}) {
    if (registerType == "Email") {
      toggleEmailOrNumberBoxContent = true;
    } else {
      toggleEmailOrNumberBoxContent = false;
    }
    emit(AuthToggleWithEmailOrNumberBoxContent());
  }

  void toggleEmailRegistrationStepsBoxContent() {
    toggleEmailRegistrationSteps = !toggleEmailRegistrationSteps;
    emit(AuthToggleEmailRegistrationStepsBoxContent());
  }

  void togglePhoneNumberRegistrationStepsBoxContent() {
    togglePhoneNumberRegistrationSteps = !togglePhoneNumberRegistrationSteps;
    emit(AuthToggleEmailRegistrationStepsBoxContent());
  }

  void signInWithEmailAndPassword(BuildContext context) async {
    emit(AuthSignInLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        NavigatorPushReplacement(context, HomeView());
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
    } catch (e) {
      print(e);
      showToast(e.toString(), false);
      emit(AuthSignInErrorState());
    }
  }

  void signUpWithEmailAndPassword() async {
    emit(AuthSignUpLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        isUserCreatedWithEmail = true;
        toggleEmailRegistrationSteps = true;
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

  void emailVertication(BuildContext context) async {
    emit(AuthEmailVerticationLoadingState());
    var user = FirebaseAuth.instance.currentUser;
    try {
      await user?.reload().then((value) {
        if (user.emailVerified) {
          NavigatorPushReplacement(context, HomeView());
          showToast("Registered Successfully", true);
          emit(AuthEmailVerticationSuccessState());
        } else {
          showToast("Please, Confirm your email", true);
          emit(AuthEmailVerticationSuccessState());
        }
      });
    } on Exception catch (e) {
      print(e);
      showToast(e.toString(), true);
      emit(AuthEmailVerticationErrorState());
    }
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
