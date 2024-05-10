import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({super.key,required this.controller,required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255),
          ),),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255),
          ),),
          hintText: hintText,
          hintStyle: TextStyle(color:Color.fromARGB(255, 97, 97, 97)),
      ),
    );
  }
}