import 'package:ecomm/data/model/response/LoginResponse.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{

}
class LoginLoadingState extends LoginStates{

}
class LoginErrorState extends LoginStates{
  String errorMessage;
  LoginErrorState({required this.errorMessage});

}
class LoginSuccessState extends LoginStates{
  LoginResponse succ;
  LoginSuccessState({required this.succ});

}