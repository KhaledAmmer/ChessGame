import 'package:flutter/material.dart';

Padding AlignLetter(BuildContext context,n) {
  return Padding(
    padding:  EdgeInsets.only(right: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Letter(context, "A",n),
        Letter(context, "B",n),
        Letter(context, "C",n),
        Letter(context, "D",n),
        Letter(context, "E",n),
        Letter(context, "F",n),
        Letter(context, "G",n),
        Letter(context, "H",n),

      ],

    ),
  );
}
Align buildAlign(BuildContext context,algin) {
  return Align(
    alignment: algin,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height:MediaQuery.of(context).size.height/14,),
        Nums(context, "1"),
        Nums(context, "2"),
        Nums(context, "3"),
        Nums(context, "4"),
        Nums(context, "5"),
        Nums(context, "6"),
        Nums(context, "7"),
        Nums(context, "8"),
      ],
    ),
  );
}
Letter(BuildContext context, String text,n) {
  return   Padding(
    padding: const EdgeInsets.only(right: 1),
    child: Container(
      alignment:n==1? Alignment.bottomCenter:Alignment.center,
      width: MediaQuery.of(context).size.width / 9,
      height: MediaQuery.of(context).size.width / 8.5,
      child: Text(
        text,
        style: TextStyle(fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
Nums(BuildContext context, String text) {
  return   Padding(
    padding: const EdgeInsets.only(top: 1),
    child: Container(
      height: MediaQuery.of(context).size.width / 8.5,
      child: Text(
        text,
        style: TextStyle(fontSize: 22, color: Colors.white),

      ),
    ),
  );
}