import 'package:ecomm/ui/auth/register/cubit/register_cubit.dart';
import 'package:ecomm/ui/auth/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/home_screen.dart';
import '../../utils/dialouge_utils.dart';
class RegisterScreen extends StatefulWidget {
  final RegisterCubit cubit=RegisterCubit();
  static const String routeName = 'register';

  RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit cubit = RegisterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterStates>(
        bloc:cubit,
      listener:(context,state){
        if(state is RegisterLoadingState){
          DialogeUtils.showLoading(context: context, loadingLabel: "Loading...");
        }
        else if(state is RegisterErrorState){
          DialogeUtils.hideLoading(context);
          DialogeUtils.showMessage(context: context, content: state.errorMessage
          ,posActionName:"ok",title: 'Error');

        }
        else if(state is RegisterSuccessState){
          DialogeUtils.hideLoading(context);
          DialogeUtils.showMessage(context: context, content: "Register Successfully",
          posActionName:"ok",title: 'Success'
          ,posAction: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },);
        }

      },
        child:
        Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 65, 130),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: Image.asset('assets/route.png', height: 100),
              ),
              buildTextField('Full Name', 'Enter your full name', cubit.nameController),
              const SizedBox(height: 20),
              buildTextField('Mobile Number', 'Enter your mobile number', cubit.phoneController, keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              buildTextField('Email Address', 'Enter your email address', cubit.emailController, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20),
              buildTextField('Password', 'Enter your password', cubit.passController, obscureText: cubit.isObscure, suffixIcon: IconButton(
                icon: Icon(cubit.isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    cubit.isObscure = !cubit.isObscure;
                  });
                },
              )
              ),
              const SizedBox(height: 20),
              buildTextField('Confirm Password', 'Re-enter your password', cubit.confController, obscureText: cubit.isObscure, suffixIcon: IconButton(
                  icon: Icon(cubit.isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
          onPressed: () {
          setState(() {
            cubit.isObscure = !cubit.isObscure;
          });
        },
      )),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: (){cubit.register();},
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Sign Up', style: TextStyle(color: Color.fromARGB(255, 0, 65, 130), fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Already have an account? Login", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildTextField(String labelText, String hintText,
      TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, bool obscureText = false, Widget? suffixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: const TextStyle(color: Color.fromARGB(
            255, 255, 255, 255), fontSize: 16)),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            suffixIcon: suffixIcon,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $labelText';
            }
            if (labelText == 'Email Address' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            if (labelText == 'Password' && value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            if (labelText == 'Confirm Password' && value != cubit.passController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}
