import 'package:chat_app/core/cubits/auth_cubit/auth_states.dart';
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
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';
  String phoneNumber = '';

  bool isEmailVericationSent = false;
  bool isSmsCodeVericationSent = false;
  bool isSmsCodeVericationResent = false;

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

  void toggleIsSmsCodeVericationResent() {
    isSmsCodeVericationResent = !isSmsCodeVericationResent;
    emit(AuthToggleIsSmsCodeVericationResent());
  }

  void checkingPhoneNumberGiven() {
    phoneNumber = phoneNumberController.text;
    bool isValidPhoneNumber(String phoneNumber) {
      if (phoneNumber.startsWith('0')) {
        this.phoneNumber = phoneNumber.replaceFirst('0', ' ');
      }
      return int.tryParse(phoneNumber) != null;
    }

    bool isValid = isValidPhoneNumber(phoneNumber);
    if (isValid) {
      isPhoneNumberGiven = true;
      togglePhoneNumberRegistrationSteps = true;
    } else {
      showToast("invalid phone number", false);
    }
    emit(AuthCheckingPhoneNumberGivenState());
    print(phoneNumber);
  }

  void sendSmsCode() async {
    emit(AuthSendingSmsCodeVerticationLoadingState());
    try {
      await FirebaseAuth.instance
          .verifyPhoneNumber(
        phoneNumber: '+20${phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          //   await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            showToast('Not valid phone number', false);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      )
          .then((value) {
        isSmsCodeVericationSent = true;
        emit(AuthSendingSmsCodeVerticationSuccessState());
      });
    } catch (e) {
      print(e.toString());
      showToast(e.toString(), false);
      emit(AuthSendingSmsCodeVerticationSuccessState());
    }
  }

  void resendSmsCode() {
   signOut();
   sendSmsCode();
    toggleIsSmsCodeVericationResent();
  }

  void signInWithPhoneNumber(
      {required String smsCode, required BuildContext context}) async {
    emit(AuthPhoneNumberSignInLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        NavigatorPushReplacement(context, HomeView());
        showToast("Logined Successfully", true);
        emit(AuthPhoneNumberSignInSuccessState());
      } else {
        print("Faild");
        showToast("Check the code", false);
        emit(AuthPhoneNumberSignInSuccessState());
      }
    } catch (e) {
      print(e.toString());
      String errorMessage = 'An error occurred. Please try again later.';
      if (e is FirebaseAuthException && e.code == 'invalid-verification-code') {
        errorMessage = 'The SMS code entered is invalid';
      }
      showToast(errorMessage, false);
      emit(AuthPhoneNumberSignInErrorState());
    }
  }

  // void recaptchaLayer() async {
  //   ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
  //       '+44 7123 123 456',
  //       RecaptchaVerifier(
  //         auth: FirebaseAuthPlatform,
  //           container: 'recaptcha',
  //           size: RecaptchaVerifierSize.compact,
  //           theme: RecaptchaVerifierTheme.dark,
  //           onSuccess: () => print('reCAPTCHA Completed!'),
  //           onError: (FirebaseAuthException error) => print(error),
  //           onExpired: () => print('reCAPTCHA Expired!')));
  // }

  void signInWithEmailAndPassword(BuildContext context) async {
    emit(AuthEmailSignInLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        NavigatorPushReplacement(context, HomeView());
        showToast("Logined Successfully", true);
        emit(AuthEmailSignInSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found", false);
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password", false);
      }
      emit(AuthEmailSignInErrorState());
    } catch (e) {
      print(e);
      showToast(e.toString(), false);
      emit(AuthEmailSignInErrorState());
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

  void signOut() async {
    emit(AuthSignedOutLoadingState());
    try {
      await FirebaseAuth.instance.signOut();
      emit(AuthSignedOutSuccessState());
    } catch (e) {
      print(e.toString());
      showToast(e.toString(), false);
      emit(AuthSignedOutErrorState());
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


// Phone Authentication...
//
// 1- Enable Phone as a Sign-In method in the Firebase console.
//
// 2- Set your app's SHA-1 (for android)....
// Going to the firebase console and selecting a project
// Clicking on the android icon and go to setting
// Scrolling down and clicking Add Fingerprint
// Run this command(FOR YOUR DEVICE ONLY) >>> keytool -list -v -alias androiddebugkey -keystore "C:\Users\Mega Store\.android\debug.keystore" -storepass android
// Then add the SHA1: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  into firebase.
//
// 3- The code
// note: for resending the code without problems, ensure that you signed out.