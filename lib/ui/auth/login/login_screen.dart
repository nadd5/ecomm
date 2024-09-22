import 'package:ecomm/ui/auth/login/cubit/login_cubit.dart';
import 'package:ecomm/ui/auth/login/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/home_screen.dart';
import '../../utils/dialouge_utils.dart';
import '../register/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';

  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginCubit cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogeUtils.showLoading(context: context, loadingLabel: "Waiting...");
        } else if (state is LoginErrorState) {
          DialogeUtils.hideLoading(context);
          DialogeUtils.showMessage(
            context: context,
            content: state.errorMessage,
            title: 'Error',
            posActionName: 'OK',
          );
        } else if (state is LoginSuccessState) {
          DialogeUtils.hideLoading(context);
          DialogeUtils.showMessage(
            context: context,
            content: "Login Successfully",
            title: 'Success',
            posActionName: 'OK',
            posAction: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 65, 130),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Image.asset('assets/route.png'),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome Back To Route',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please sign in with your mail',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildTextField('Email Address', 'Enter your email', cubit.emailController, TextInputType.emailAddress),
                  const SizedBox(height: 20),
                  buildTextField('Password', 'Enter your password', cubit.passController,
                      /*isObscure: cubit.isObscure, suffixIcon: IconButton(
                    icon: Icon(cubit.isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        cubit.isObscure = !cubit.isObscure;
                      });
                    },*/
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      cubit.login();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 0, 65, 130),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Login', style: TextStyle(color: Color.fromARGB(255, 0, 65, 130), fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: const Text("Don't have an account? Create Account", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String hintText, TextEditingController controller, [TextInputType keyboardType = TextInputType.text, bool obscureText = false, Widget? suffixIcon]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: const TextStyle(color: Colors.white, fontSize: 16)),
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
            return null;
          },
        ),
      ],
    );
  }
}
