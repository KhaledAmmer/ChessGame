import 'package:flutter/material.dart';

userCard(name,url) {
  return Container(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(

              shape: BoxShape.circle,
              image: DecorationImage(image:NetworkImage(url) ),
            ),
          ),
          SizedBox(width: 20,),
          Text(name,style: TextStyle(color: Colors.white,fontSize: 20),),
        ],
      ),
    ),

  );

}