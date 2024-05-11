import 'package:flutter/material.dart';

class WallPost extends StatelessWidget {
  final String message;
  final String user;
  const WallPost(
      {super.key,
      required this.message,
      required this.user,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Flexible(
        child: Container(
          decoration: BoxDecoration(color: Colors.white30),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message,style: TextStyle(color: Colors.white),softWrap: true,),
          )
          )
      ),
    );
  }
}
