import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // width: 150,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white54, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 19, color: Colors.black),
          )),
        ),
      ),
    );
  }
}
