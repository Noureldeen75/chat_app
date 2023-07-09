import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField(
      {super.key, required this.label, required this.prefixIconDate, required this.controller});

  final String label;
  final IconData prefixIconDate;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: ColorsClass.shadowColor,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyles.textSize18.copyWith(color: ColorsClass.mainBlue),
        cursorColor: ColorsClass.mainBlue,
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyles.textSize18,
          ),
          prefixIcon: Icon(prefixIconDate),
          filled: true,
          fillColor: ColorsClass.blue1, // Set the background color here
          contentPadding: EdgeInsets.symmetric(vertical: 13.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorsClass.mainBlue),
          ),
        ),
      ),
    );
  }
}
