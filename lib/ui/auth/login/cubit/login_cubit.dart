import 'package:ecomm/data/api_manager.dart';
import 'package:ecomm/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool isObscure = true;
  void login()async{
    if(formKey.currentState?.validate()==true){
      try{
        emit(LoginLoadingState());
        var response=await ApiManager.Login(emailController.text,
            passController.text);
        if(response.statusMsg=='fail'){
          emit(LoginErrorState(errorMessage: response.message!));
          print('message:${response.message}');
        }
        else{
          emit(LoginSuccessState(succ: response));
          print('message:${response.token}'
              );
        }

      }catch(e){
        emit(LoginErrorState(errorMessage: e.toString()));

      }
    }
  }
}