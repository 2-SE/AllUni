import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class SignUpInOut {

  Future<void> SignUp(String username, String password, String email) async  {
    Map<CognitoUserAttributeKey, String> userAttributes = {CognitoUserAttributeKey.email: email};
    try{
      await Amplify.Auth.signUp(username: username, password: password, options: CognitoSignUpOptions(userAttributes: userAttributes));
    }catch(e){rethrow;}
  }
  Future<void> ConfirmSignUp(String username, String confCode) async  {
    try{
      await Amplify.Auth.confirmSignUp(username: username, confirmationCode: confCode);
    }catch(e){rethrow;}
  }

  Future<void> SignIn(String username, String password) async  {
    try{
      await Amplify.Auth.signIn(username: username, password: password);
    }catch(e){rethrow;}
  }

  Future<void> SignOut() async  {
    try{
      await Amplify.Auth.signOut(options: const SignOutOptions(globalSignOut: true));
    }catch(e){rethrow;}
  }

  Future<void> ResetPassword(String username) async{
    try{
      await Amplify.Auth.resetPassword(username: username);
    }catch(e){rethrow;}
  }
}