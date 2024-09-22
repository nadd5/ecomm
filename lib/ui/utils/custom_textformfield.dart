import 'package:flutter/material.dart';

import 'appcolor.dart';

class CustomTextFormfield extends StatefulWidget{
  final String label;
  final Widget suffixIcon;
  final String hintText ;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormfield(
      {super.key, this.hintText ='' ,
        this.label = '',
        required this.controller,
        this.keyboardType = TextInputType.text,
        this.obscureText = false,
        required this.validator,
      this.suffixIcon = const Icon(Icons.edit_square, color:  Colors.white,)});

  @override
  State<CustomTextFormfield> createState() => _CustomTextFormfieldState();
}

class _CustomTextFormfieldState extends State<CustomTextFormfield> {
  @override
  Widget build(BuildContext context)
  {
    return
      TextFormField(
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
           hintText: widget.hintText ,
           labelText: widget.label,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.primaryColor))
                 ,
                filled: true,
                fillColor: AppColors.whiteColor,

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.primaryColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey)),
            errorMaxLines: 4),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        validator: widget.validator,


      );



  }
}

