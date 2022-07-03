import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testd/Chess/Api/FireBase.dart';
import 'package:testd/Chess/Components/BuildSvgImage.dart';
import 'package:testd/Chess/Components/Dialog.dart';
import 'package:testd/Chess/Modle/Piece.dart';
import 'package:testd/Chess/Modle/RoCns.dart';

List<Piece> setDefaultColor(List<Color> dcolor, List<Piece> ps) {
  for (int i = 0; i < ps.length; i++) {
    ps[i].boxColor = dcolor[i];
  }
  return ps;
}


Future<List<Piece>> movingColor(List<Piece> piece, int i, String name, int plyernum,context,gameId) async {
  var moveColor = Color.fromRGBO(232, 240, 243, 0.7372549019607844);

  if((piece[i].name.contains("wit") && plyernum==1)||(piece[i].name.contains("bl") && plyernum==2)){
    switch (name) {
      case "horse":
        piece = HorseCheak(i, piece, moveColor, plyernum);
        break;

      case "pawn":
        piece=await PawnCheak(piece, i, moveColor,plyernum,context,gameId);
        break;
      case "rook":
        piece = RookCheak(piece, i, plyernum, moveColor, "+", 8,array.Cols);
        piece = RookCheak(piece, i, plyernum, moveColor, "-", 8,array.Cols);
        piece = RookCheak(piece, i, plyernum, moveColor, "+", 1,array.Rows);
        piece = RookCheak(piece, i, plyernum, moveColor, "-", 1,array.Rows);
        break;
      case "bishop":
        piece = BishopCheak(piece, i, plyernum, moveColor, "-", 7);
        piece = BishopCheak(piece, i, plyernum, moveColor, "-", 9);
        piece = BishopCheak(piece, i, plyernum, moveColor, "+", 7);
        piece = BishopCheak(piece, i, plyernum, moveColor, "+", 9);
        break;
      case "queen":
        piece = RookCheak(piece, i, plyernum, moveColor, "+", 8,array.Cols);
        piece = RookCheak(piece, i, plyernum, moveColor, "-", 8,array.Cols);
        piece = RookCheak(piece, i, plyernum, moveColor, "+", 1,array.Rows);
        piece = RookCheak(piece, i, plyernum, moveColor, "-", 1,array.Rows);
        piece = BishopCheak(piece, i, plyernum, moveColor, "-", 7);
        piece = BishopCheak(piece, i, plyernum, moveColor, "-", 9);
        piece = BishopCheak(piece, i, plyernum, moveColor, "+", 7);
        piece = BishopCheak(piece, i, plyernum, moveColor, "+", 9);
        break;
      case "king":
       piece= cheakKing(piece, i ,plyernum, moveColor,context,gameId);
        break;
    }
  }


  return piece;
}


Piece KingMoves(Piece piece, int oldPlyerNum,moveColor, falseBox ) {
  if(!piece.name.contains(oldPlyerNum==1?"wit":"bl") && !falseBox ) {
    piece.boxColor = moveColor;
  }
  return piece;
}
List<Piece> cheakKing(List<Piece> piece,int j,int plyernum, Color moveColor,context,gameId) {

  List<Color> dcolor=[];
  List<List<int>> cols= array.Cols;
    List<List<int>> rows= array.Rows;
     List<int> positions=[];
    for(var row in rows){
      for(var j in row){
        if((plyernum==1 && piece[j].name.contains("bl") )|| (plyernum==2 && piece[j].name.contains("wit"))){
                positions.add(j);
        }
        dcolor.add(piece[j].boxColor);
      }
    }
    //هون عملت هيك لانه الفانكشن يلي جوا السويتش مبنية على اساس playerNum moveColor وبما اني بدي اعكسهم فحزنت قيمهم القديمة بمنغيرات لاني بدي القيم القديمة لبعدين
    Color oldColor=moveColor;
    //moveColor=Color.fromRGBO(250, 168, 168, 0.40784313725490196);
    int oldPlyerNum=plyernum;
    plyernum=plyernum==1?2:1;
    List<Piece>ps=piece;
    //جملة الشرط هي بس مشان اقدر اسكرهم بين قوسين
      for(var i in positions){
       var mColor=Colors.blueGrey;
        String name= GetPieceName(piece[i]);
        switch (name) {
          case "horse":
            piece = HorseCheak(i, piece, mColor, plyernum);
            break;
          case "pawn":
            piece=PawnCheakMate(piece, i, mColor,plyernum,);
            break;
          case "rook":
            piece = RookCheak(piece, i, plyernum, mColor, "+", 8,array.Cols);
            piece = RookCheak(piece, i, plyernum, mColor, "-", 8,array.Cols);
            piece = RookCheak(piece, i, plyernum, mColor, "+", 1,array.Rows);
            piece = RookCheak(piece, i, plyernum, mColor, "-", 1,array.Rows);
            break;
          case "bishop":
            piece = BishopCheak(piece, i, plyernum, mColor, "-", 7);
            piece = BishopCheak(piece, i, plyernum, mColor, "-", 9);
            piece = BishopCheak(piece, i, plyernum, mColor, "+", 7);
            piece = BishopCheak(piece, i, plyernum, mColor, "+", 9);
            break;
          case "queen":
            piece = RookCheak(piece, i, plyernum, mColor, "+", 8,array.Cols);
            piece = RookCheak(piece, i, plyernum, mColor, "-", 8,array.Cols);
            piece = RookCheak(piece, i, plyernum, mColor, "+", 1,array.Rows);
            piece = RookCheak(piece, i, plyernum, mColor, "-", 1,array.Rows);
            piece = BishopCheak(piece, i, plyernum, mColor, "-", 7);
            piece = BishopCheak(piece, i, plyernum, mColor, "-", 9);
            piece = BishopCheak(piece, i, plyernum, mColor, "+", 7);
            piece = BishopCheak(piece, i, plyernum, mColor, "+", 9);
            break;
        }

    }
    positions.clear();
      for(var x=0;x<piece.length ;x++){
        if(piece[x].boxColor==Colors.blueGrey){
          positions.add(x);
        }
      }
  piece=setDefaultColor(dcolor,piece);
    j+1<=63 ?piece[j+1]=KingMoves(piece[j+1], oldPlyerNum, moveColor,positions.contains(j+1)):"";
    j-1>=0 ? piece[j-1]=KingMoves(piece[j-1], oldPlyerNum, moveColor,positions.contains(j-1)):"";
    j+8<=63 ?piece[j+8]=KingMoves(piece[j+8], oldPlyerNum, moveColor,positions.contains(j+8)):"";
    j-8>=0 ? piece[j-8]=KingMoves(piece[j-8], oldPlyerNum, moveColor,positions.contains(j-8)):"";
    j+7<=63 ? piece[j+7]=KingMoves(piece[j+7], oldPlyerNum, moveColor,positions.contains(j+7)):"";
    j-7>=0 ? piece[j-7]=KingMoves(piece[j-7], oldPlyerNum, moveColor,positions.contains(j-7) ):"";
    j+9<=63 ? piece[j+9]=KingMoves(piece[j+9], oldPlyerNum, moveColor,positions.contains(j+9)):"";
    j-9>=0 ? piece[j-9]=KingMoves(piece[j-9], oldPlyerNum, moveColor,positions.contains(j+-9) ):"";

  return piece;
}






List<Piece> PawnCheakMate(List<Piece> piece, int i, Color moveColor,plyernum)  {

  if(piece[i].color != Colors.black){
    if( i + 9 <= 63 ){
       piece[i + 9].boxColor = moveColor;
    }
    if( i + 7 <= 63 ){
      piece[i + 7].boxColor = moveColor;
    }
  }else{
    if( i - 9 >= 0 ){
      piece[i - 9].boxColor = moveColor;
    }
    if( i - 7 >= 0 ){
       piece[i - 7].boxColor = moveColor;
    }
  }

  return piece;
}
Future<List<Piece>> PawnCheak(List<Piece> piece, int i, Color moveColor,plyernum,context,gameId) async {
  var rows=array.Rows;

  if(rows[1].contains(i)&&plyernum==1 ){
    if(piece[i + 8].name.contains("Non")){
    piece[i + 8].boxColor = moveColor;
    }else{
      return piece;
    }
    if(piece[i + 8*2].name.contains("Non")){
    piece[i + 8*2].boxColor = moveColor;}else{
      return piece;
    }

  }
  if(rows[6].contains(i)&&plyernum==2 ){
    if(piece[i - 8].name.contains("Non")){
      piece[i - 8].boxColor = moveColor;
    }else{
      return piece;
    }
    if(piece[i - 8*2].name.contains("Non")){
      piece[i - 8*2].boxColor = moveColor;}else{
      return piece;
    }
  }
  if (piece[i].color != Colors.black) {
    if( i + 8 <= 63)
    piece[i+8].name.contains("Non") ? piece[i + 8].boxColor = moveColor : "";
  } else {
    if(i - 8 >= 0)
     piece[i-8].name.contains("Non") ? piece[i - 8].boxColor = moveColor : "";
  }
  if(piece[i].color != Colors.black){
    if( i + 9 <= 63 ){
      piece[i+9].name.contains("bl")? piece[i + 9].boxColor = moveColor:"";
    }
    if( i + 7 <= 63 ){
      piece[i+7].name.contains("bl")? piece[i + 7].boxColor = moveColor:"";
    }
  }else{
    if( i - 9 >= 0 ){
      piece[i-9].name.contains("wit")? piece[i - 9].boxColor = moveColor:"";
    }
    if( i - 7 >= 0 ){
      piece[i-7].name.contains("wit")? piece[i - 7].boxColor = moveColor:"";
    }
  }
  if(rows[7].contains(i)&&plyernum==1 ){
    String oldName=piece[i].name;
    piece[i]=await ReplacePiece(piece[i],context);
    FireBase.fireBase.UpdatePieceName(oldName,piece[i],gameId);
    return piece;
  }

  return piece;
}
ReplacePiece(Piece piece,context) async{
  PwanDialog PwD=PwanDialog(piece);
  await PwD.buildSvgDialog(context);
  piece=PwD.piece;
  print(piece.name);
  return piece;
}

List<Piece> BishopCheak(
    List<Piece> piece, int j, int plyernum, Color moveColor, opr, int n) {
  int factor = 1;
  bool cheak = true;
  List<List<int>> Cols = array.Cols;
  if (Cols[0].contains(j)) {
    if (opr == "+" && n == 7) {
      return piece;
    } else if (opr == "-" && n == 9) {
      return piece;
    }
  }
  if (Cols[7].contains(j)) {
    if (opr == "-" && n == 7) {
      return piece;
    } else if (opr == "+" && n == 9) {
      return piece;
    }
  }
  switch (opr) {
    case "-":
      while (cheak) {
        if (Cols[7].contains(j - n * factor) ||
            Cols[0].contains(j - n * factor)) {
          if (j - n * factor >= 0){
            if(piece[j-n*factor].name.contains(plyernum==1?"wit":"bl") ){

              break;}
            else
              piece[j - n * factor].boxColor = moveColor;
        }
          break;
        } else {

          if (j - n * factor >= 0) {
            if (piece[j - n * factor].name.contains("Non")) {
              piece[j - n * factor].boxColor = moveColor;
              factor++;
            } else {
              piece[j - n * factor].name.contains(plyernum == 2 ? "wit" : "bl")
                  ? piece[j - n * factor].boxColor = moveColor
                  : cheak = false;
              break;
            }

          } else {
            cheak = false;
          }
        }
      }
      break;
    case "+":
      while (cheak) {
        if (Cols[7].contains(j + n * factor) ||
            Cols[0].contains(j + n * factor)) {
          if (j + n * factor >= 0) {
            if (piece[j + n * factor].name.contains(
                plyernum == 1 ? "wit" : "bl"))
              break;
            else
              piece[j + n * factor].boxColor = moveColor;
          }
          break;
        }else {
          if (j + n * factor <= 63) {
            if (piece[j + n * factor].name.contains("Non")) {
              piece[j + n * factor].boxColor = moveColor;
              factor++;
            } else {
              piece[j + n * factor].name.contains(plyernum == 2 ? "wit" : "bl")
                  ? piece[j + n * factor].boxColor = moveColor
                  : cheak = false;
              break;
            }
          } else {
            cheak = false;
          }
        }
      }
      break;
  }


  return piece;
}

List<Piece> HorseCheak(int i, List<Piece> piece, Color moveColor, plyernum) {
  List<List<int>> Cols = array.Cols;
  List<int> defaultCols = [];
  for (int i = 2; i <= 5; i++) {
    for (var cols in Cols[i]) {
      defaultCols.add(cols);
    }
  }
  if (defaultCols.contains(i)) {
    i + 17 <= 63 && (!piece[i + 17].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i + 17].boxColor = moveColor
        : "";
    i - 17 >= 0 && (!piece[i - 17].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i - 17].boxColor = moveColor
        : "";
    i + 15 <= 63 && (!piece[i + 15].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i + 15].boxColor = moveColor
        : "";
    i - 15 >= 0 && (!piece[i - 15].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i - 15].boxColor = moveColor
        : "";
    i + 10 <= 63 && (!piece[i + 10].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i + 10].boxColor = moveColor
        : "";
    i - 10 >= 0 && (!piece[i - 10].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i - 10].boxColor = moveColor
        : "";
    i + 6 <= 63 && (!piece[i + 6].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i + 6].boxColor = moveColor
        : "";
    i - 6 >= 0 && (!piece[i - 6].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i - 6].boxColor = moveColor
        : "";
  } else if (Cols[1].contains(i)) {
    i + 17 <= 63 && (!piece[i + 17].name.contains("wit"))
        ? piece[i + 17].boxColor = moveColor
        : "";
    i - 17 >= 0 && (!piece[i - 17].name.contains("wit"))
        ? piece[i - 17].boxColor = moveColor
        : "";
    i + 15 <= 63 && (!piece[i + 15].name.contains("wit"))
        ? piece[i + 15].boxColor = moveColor
        : "";
    i - 15 >= 0 && (!piece[i - 15].name.contains("wit"))
        ? piece[i - 15].boxColor = moveColor
        : "";
    i + 10 <= 63 && (!piece[i + 10].name.contains("wit"))
        ? piece[i + 10].boxColor = moveColor
        : "";
    i - 6 >= 0 && (!piece[i - 6].name.contains("wit"))
        ? piece[i - 6].boxColor = moveColor
        : "";
  } else if (Cols[6].contains(i)) {
    i + 17 <= 63 && (!piece[i + 17].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i + 17].boxColor = moveColor
        : "";
    i - 17 >= 0 && (!piece[i - 17].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i - 17].boxColor = moveColor
        : "";
    i + 15 <= 63 && (!piece[i + 15].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i + 15].boxColor = moveColor
        : "";
    i - 15 >= 0 && (!piece[i - 15].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i - 15].boxColor = moveColor
        : "";
    i - 10 >= 0 && (!piece[i - 10].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i - 10].boxColor = moveColor
        : "";
    i + 6 <= 63 && (!piece[i + 6].name.contains(plyernum == 1 ? "wit" : "bl"))
        ? piece[i + 6].boxColor = moveColor
        : "";
  } else if (Cols[0].contains(i)) {
    i + 17 <= 63 && (!piece[i + 17].name.contains("wit"))
        ? piece[i + 17].boxColor = moveColor
        : "";
    i - 15 >= 0 && (!piece[i - 15].name.contains("wit"))
        ? piece[i - 15].boxColor = moveColor
        : "";

    i + 10 <= 63 && (!piece[i + 10].name.contains("wit"))
        ? piece[i + 10].boxColor = moveColor
        : "";
    i - 6 >= 0 && (!piece[i - 6].name.contains("wit"))
        ? piece[i - 6].boxColor = moveColor
        : "";
  } else {
    i + 15 <= 63 && (!piece[i + 15].name.contains("wit"))
        ? piece[i + 15].boxColor = moveColor
        : "";
    i - 17 >= 0 && (!piece[i - 17].name.contains("wit"))
        ? piece[i - 17].boxColor = moveColor
        : "";

    i - 10 <= 63 && (!piece[i - 10].name.contains("wit"))
        ? piece[i - 10].boxColor = moveColor
        : "";
    i + 6 >= 0 && (!piece[i + 6].name.contains("wit"))
        ? piece[i + 6].boxColor = moveColor
        : "";
  }

  return piece;
}


List<Piece> RookCheak(List<Piece> piece, int j, int plyernum, Color moveColor,
    opr, int n, List<List<int>> Cols) {
  int factor = 1;
  bool cheak = true;
  int Ccol = 9;
  for (var col = 0; col < Cols.length; col++) {
    if (Cols[col].contains(j)) {
      Ccol = col;
      break;
    }
  }
  try{switch (opr) {
    case "-":
      while (cheak) {
        if (j - n * factor >= Cols[Ccol].first) {
          if (piece[j - n * factor].name.contains("Non")) {
            piece[j - n * factor].boxColor = moveColor;
          } else {
            if (piece[j - n * factor]
                .name
                .contains(plyernum == 1 ? "wit" : "bl")) {
              break;
            } else {
              piece[j - n * factor].boxColor = moveColor;
              break;
            }
          }
          factor++;
        } else {
          cheak = false;
        }
      }
      break;
    case "+":
      while (cheak) {
        if (j + n * factor <= Cols[Ccol].last) {
          if (piece[j + n * factor].name.contains("Non")) {
            piece[j + n * factor].boxColor = moveColor;
          } else {
            if (piece[j + n * factor]
                .name
                .contains(plyernum == 1 ? "wit" : "bl")) {
              break;
            } else {
              piece[j + n * factor].boxColor = moveColor;
              break;
            }
          }
          factor++;
        } else {
          cheak = false;
        }
      }

      break;
  }}catch(e){

  }

  return piece;
}
