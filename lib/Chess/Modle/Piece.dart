import 'package:flutter/material.dart';

class Piece {

  String  name;
  final Color color;
  final int position;
  final moveColor;
  Color boxColor;



  Piece({this.moveColor, required this.boxColor, required this.name,required this.color, required this.position,});


}
