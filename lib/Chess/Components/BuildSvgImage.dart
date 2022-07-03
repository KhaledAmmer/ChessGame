import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testd/Chess/Modle/Piece.dart';

String GetPieceName(Piece piece) {
  String name = piece.name.toLowerCase();
  if (name.contains("pawn")) {
    name = "pawn";
  } else if (name.contains("rook")) {
    name = "rook";
  } else if (name.contains("horse")) {
    name = "horse";
  } else if (name.contains("bishop")) {
    name = "bishop";
  }else if(name.contains("king")){
    name="king";
  }else if(name.contains("queen")){
    name="queen";
  }else{
    name= "non";
  }

  return name;
}

buildSvg(Piece piece) {
  try{
    return !piece.name.contains("Non") ? buildSvgPicture(piece) : Container();
  }catch(e){

  }
}

buildSvgPicture(Piece piece) {
  String name =  GetPieceName(piece);

  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: SvgPicture.asset("assets/images/$name.svg",
        color: piece.color == Colors.white
            ? Color.fromRGBO(226, 219, 219, 1.0)
            : Colors.black,
        placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator())),
  );
}