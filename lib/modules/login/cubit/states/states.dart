import 'package:concaty_shop/model/model_login.dart';

abstract class LoginStates{}
class InitialState extends LoginStates{}
class LoginSuccessState extends LoginStates{
 final LoginModel model;

  LoginSuccessState(this.model);
}
class LoginErrorState extends LoginStates{}
class SignupSuccessState extends LoginStates{}
class ChangeObscureSuccessState extends LoginStates{}
class SignupErrorState extends LoginStates{}