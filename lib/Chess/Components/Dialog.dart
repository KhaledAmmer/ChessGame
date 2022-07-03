import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testd/Chess/Components/BuildSvgImage.dart';
import 'package:testd/Chess/Modle/Piece.dart';
import 'package:testd/components/button.dart';
import 'package:testd/components/textfiled.dart';

buildDialog(context, id, fun,text) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(26, 57, 90, 1.0),
          title: Container(

              child: Column(
                children: [
                  textfiled1(
                      fillcolor: Colors.black,
                      cor: id,
                      hint: "game Id",
                      isPw: false,
                      kt: TextInputType.text,
                      prefix: Icons.add),
                  button(
                      text: text,
                      textcolor: Colors.white,
                      bcolor: Colors.blue,
                      myfun: fun),
                ],
              )),
        );
      });
}


class PwanDialog{
  Piece piece;
  PwanDialog(this.piece);


  buildSvgDialog(context) async{
  var random= Random().nextInt(5);
    List<Piece> piece = [
      Piece(
        name: "witRook$random",
        color: this.piece.color,
        position: this.piece.position,
        boxColor: this.piece.boxColor,
      ),
      Piece(
        name: "witHorse$random",
        color: this.piece.color,
        position: this.piece.position,
        boxColor: this.piece.boxColor,
      ),
      Piece(
        name: "witBishop$random",
        color: this.piece.color,
        position: this.piece.position,
        boxColor: this.piece.boxColor,
      ),
      Piece(
        name: "witQueen$random",
        color: this.piece.color,
        position: this.piece.position,
        boxColor: this.piece.boxColor,
      ),
    ];
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            backgroundColor: Colors.orange,
            content: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PieceContainer(piece[0], context,(){
                      this.piece=piece[0];
                    }),
                    PieceContainer(piece[1], context,(){
                      this.piece=piece[1];
                    }),
                    PieceContainer(piece[2], context,(){
                      this.piece=piece[2];
                    }),
                    PieceContainer(piece[3], context,(){
                      this.piece=piece[3];
                    }),
                  ],
                )),
          );
        });
  }

}




Container PieceContainer(Piece piece, context,fun) {
  return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width / 5,
      height: 100,
      child: MaterialButton(
        onPressed: (){
          fun();
          Navigator.pop(context);
          },
        child: buildSvgPicture(piece),
      ));
}
