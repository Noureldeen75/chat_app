abstract class AuthStates {}

class AuthInitialState extends AuthStates{}

class AuthSignInLoadingState extends AuthStates{}
class AuthSignInSuccessState extends AuthStates{}
class AuthSignInErrorState extends AuthStates{}

class AuthSignUpLoadingState extends AuthStates{}
class AuthSignUpSuccessState extends AuthStates{}
class AuthSignUpErrorState extends AuthStates{}
