abstract class AuthStates {}

class AuthInitialState extends AuthStates{}

class AuthToggleWithEmailOrNumberBoxContent extends AuthStates{}
class AuthToggleEmailRegistrationStepsBoxContent extends AuthStates{}
class AuthTogglePhoneNumberRegistrationStepsBoxContent extends AuthStates{}
class AuthToggleIsSmsCodeVericationResent extends AuthStates{}

class AuthEmailSignInLoadingState extends AuthStates{}
class AuthEmailSignInSuccessState extends AuthStates{}
class AuthEmailSignInErrorState extends AuthStates{}

class AuthPhoneNumberSignInLoadingState extends AuthStates{}
class AuthPhoneNumberSignInSuccessState extends AuthStates{}
class AuthPhoneNumberSignInErrorState extends AuthStates{}

class AuthCheckingPhoneNumberGivenState extends AuthStates{}

class AuthSignUpLoadingState extends AuthStates{}
class AuthSignUpSuccessState extends AuthStates{}
class AuthSignUpErrorState extends AuthStates{}

class AuthSendingEmailVerticationLoadingState extends AuthStates{}
class AuthSendingEmailVerticationSuccessState extends AuthStates{}
class AuthSendingEmailVerticationErrorState extends AuthStates{}

class AuthSendingSmsCodeVerticationLoadingState extends AuthStates{}
class AuthSendingSmsCodeVerticationSuccessState extends AuthStates{}
class AuthSendingSmsCodeVerticationErrorState extends AuthStates{}

class AuthEmailVerticationLoadingState extends AuthStates{}
class AuthEmailVerticationSuccessState extends AuthStates{}
class AuthEmailVerticationErrorState extends AuthStates{}


class AuthSignedOutLoadingState extends AuthStates{}
class AuthSignedOutSuccessState extends AuthStates{}
class AuthSignedOutErrorState extends AuthStates{}



class AuthDeletingUserAccountLoadingState extends AuthStates{}
class AuthDeletingUserAccountSuccessState extends AuthStates{}
class AuthDeletingUserAccountErrorState extends AuthStates{}