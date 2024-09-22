import 'package:ecomm/data/model/response/RegisterResponse.dart';

abstract class RegisterStates
{

}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}
class RegisterSuccessState extends RegisterStates{
  RegisterResponse succ;
  RegisterSuccessState({required this.succ});
}
