import 'package:bloc/bloc.dart';
import 'package:ecomm/data/api_manager.dart';
import 'package:ecomm/ui/auth/register/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterInitialState());
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text:"aaa");
  final emailController = TextEditingController(text:"a8@gmail.com");
  final passController = TextEditingController(text:"123456");
  final confController = TextEditingController(text:"123456");
  final phoneController = TextEditingController(text:"01010700701");
  bool isObscure = true;
  Future<void>register()async {
    if(formKey.currentState?.validate()==true){
    try {
      emit(RegisterLoadingState());
      var response = await ApiManager.register(
          nameController.text,
          emailController.text, passController.text,
          confController.text, phoneController.text);
      if(response.statusMsg=='fail'){
        emit(RegisterErrorState(errorMessage: response.message!));
      }else{
        emit(RegisterSuccessState(succ: response));
      }
    }catch(e){
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}}