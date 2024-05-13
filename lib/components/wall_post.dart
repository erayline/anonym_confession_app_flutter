import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WallPost extends StatelessWidget {
  final String message;
  final String user;
  final Color color;
  final Color anonimColor;
  final String time;
  
  const WallPost(
      {super.key,
      required this.message,
      required this.user, required this.color, required this.anonimColor, required this.time,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Flexible(
        child: Container(
          decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Anonim",style: TextStyle(color: anonimColor,fontWeight: FontWeight.bold),),
                    Text(time,style: TextStyle(color: const Color.fromARGB(130, 255, 255, 255)),),
                  ],
                ),
                SizedBox(height: 10,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(message,style: TextStyle(color: Colors.white),softWrap: true,)),
                    // GestureDetector(
                    //   onTap: (){print('yoruma tıklandı');},
                    //   child: Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    //   child: Icon(Icons.comment,color: Colors.white60,)))
                  ],
                ),
              ],
            ),
          )
          )
      ),
    );
  }
}
