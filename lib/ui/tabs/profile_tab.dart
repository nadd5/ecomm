import 'package:flutter/material.dart';

import '../auth/login/login_screen.dart';
import '../utils/app_theme.dart';
import '../utils/appcolor.dart';
import '../utils/custom_textformfield.dart';
import '../utils/shared_preference_utils.dart';
class ProfileTab extends StatefulWidget {

  static const String routeName = "account_Screen";

  @override
  State<ProfileTab> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ProfileTab> {
  TextEditingController nameController =
  TextEditingController();

  TextEditingController passwordController =
  TextEditingController();

  TextEditingController numberController =
  TextEditingController();

  TextEditingController emailController =
  TextEditingController();

  TextEditingController addressController =
  TextEditingController();

  TextEditingController mobileController =
  TextEditingController();


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          automaticallyImplyLeading: false
          ,
          title: Style.Logo,
          actions: [
            IconButton(
                onPressed: () {
                  SharedPreferenceUtils.removeData(key: 'token');
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (route) => false);
                },
                icon: Icon(
                  Icons.logout,
                  color: AppColors.primaryColor,
                ))
          ],
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(12.0),

          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Text("Welcome Back",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.pr)),
                  Text("insert email",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.bgDarkColor),textAlign: TextAlign.left,),
                  SizedBox(height: MediaQuery.of(context).size.height*0.030),

                  Text("Your Full name", style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18,color: AppColors.pr),),

                  SizedBox(height: MediaQuery.of(context).size.height*0.010),

                  SizedBox(
                    height: 80,
                    child: CustomTextFormfield(
                        label:"full name" ,
                        controller: nameController,
                        suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.pr)),
                        validator: (text){
                          if (text == null || text.trim().isEmpty){
                            return 'Please Enter Your Full Name';
                          }
                          return null; }
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.010),

                  Text("Your E-mail", style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18,color: AppColors.pr),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.010),
                  SizedBox(
                    height: 80,
                    child: CustomTextFormfield(
                        label:"e-mail" ,
                        suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.pr)),
                        controller: emailController,
                        validator: (text){
                          if (text == null || text.trim().isEmpty){
                            return 'Please Enter Your E-mail';
                          }
                          return null; }
                    ),
                  ),


                  SizedBox(height: MediaQuery.of(context).size.height*0.010),

                  Text("Password", style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.pr),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.010),
                  SizedBox(
                    height: 80,
                    child: CustomTextFormfield(
                        label:"enter your password" ,
                        suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.pr)),
                        controller: passwordController,
                        obscureText: true,
                        validator: (text){
                          if (text == null || text.trim().isEmpty){
                            return 'Please Enter Password';
                          }
                          return null; }
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.010),
                  Text("Your mobile number", style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18,color: AppColors.pr),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.010),
                  SizedBox(
                    height: 80,
                    child: CustomTextFormfield(
                        label:"Your mobile number" ,
                        keyboardType: TextInputType.number,
                        suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.pr,)) ,
                        controller: mobileController,
                        validator: (text){
                          if (text == null || text.trim().isEmpty){
                            return 'Please Enter Your mobile number';
                          }
                          return null; }
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.010),
                  Text("Your Address", style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18,color: AppColors.pr),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.010),

                  SizedBox(
                    height: 80,
                    child: CustomTextFormfield(
                        label:"Your address" ,
                        keyboardType:TextInputType.streetAddress,
                        suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.pr)),
                        controller: addressController,
                        validator: (text){
                          if (text == null || text.trim().isEmpty){
                            return 'Please Enter Your Address';
                          }
                          return null; }
                    ),
                  ),





                ],
              ),
            ),
          ),
        )

    );
  }
}
