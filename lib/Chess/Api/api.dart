import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testd/Chess/Modle/Piece.dart';

List<Piece> CreatePieceApi(FirebaseFirestore db, String gameId) {
  List<Color> bCs = [
    Color.fromRGBO(122, 125, 73, 1.0),
    Color.fromRGBO(81, 138, 146, 1.0),
  ];

  List<Piece> ps = [
    Piece(
      name: "witRook",
      color: Colors.white,
      position: 0,
      boxColor: bCs[0],
    ),
    Piece(
      name: "witHorse",
      color: Colors.white,
      position: 1,
      boxColor: bCs[1],
    ),
    Piece(
      name: "witBishop",
      color: Colors.white,
      position: 2,
      boxColor: bCs[0],
    ),
    Piece(
      name: "witQueen",
      color: Colors.white,
      position: 3,
      boxColor: bCs[1],
    ),
    Piece(
      name: "witKing",
      color: Colors.white,
      position: 4,
      boxColor: bCs[0],
    ),
    Piece(
      name: "witBishop2",
      color: Colors.white,
      position: 5,
      boxColor: bCs[1],
    ),
    Piece(
      name: "witHorse2",
      color: Colors.white,
      position: 6,
      boxColor: bCs[0],
    ),
    Piece(
      name: "witRook2",
      color: Colors.white,
      position: 7,
      boxColor: bCs[1],
    ),
    Piece(
      name: "witPawn1",
      color: Colors.white,
      position: 8,
      boxColor: bCs[1],
    ),
    Piece(
      name: "witPawn2",
      color: Colors.white,
      position: 9,
      boxColor: bCs[0],
    ),
    Piece(
      name: "witPawn3",
      color: Colors.white,
      position: 10,
      boxColor: bCs[1],
    ),
    Piece(
      name: "witPawn4",
      color: Colors.white,
      position: 11,
      boxColor: bCs[0],
    ),
    Piece(
      name: "witPawn5",
      color: Colors.white,
      position: 12,
      boxColor: bCs[1],
    ),
    Piece(
      name: "witPawn6",
      color: Colors.white,
      position: 13,
      boxColor: bCs[0],
    ),
    Piece(
      name: "witPawn7",
      color: Colors.white,
      position: 14,
      boxColor: bCs[1],
    ),
    Piece(
      name: "witPawn8",
      color: Colors.white,
      position: 15,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non1",
      color: Colors.white,
      position: 16,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non2",
      color: Colors.white,
      position: 17,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non3",
      color: Colors.white,
      position: 18,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non4",
      color: Colors.white,
      position: 19,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non5",
      color: Colors.white,
      position: 20,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non6",
      color: Colors.white,
      position: 21,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non7",
      color: Colors.white,
      position: 22,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non8",
      color: Colors.white,
      position: 23,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non9",
      color: Colors.white,
      position: 24,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non10",
      color: Colors.white,
      position: 25,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non11",
      color: Colors.white,
      position: 26,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non12",
      color: Colors.white,
      position: 27,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non13",
      color: Colors.white,
      position: 28,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non14",
      color: Colors.white,
      position: 29,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non15",
      color: Colors.white,
      position: 30,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non16",
      color: Colors.white,
      position: 31,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non17",
      color: Colors.white,
      position: 32,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non18",
      color: Colors.white,
      position: 33,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non19",
      color: Colors.white,
      position: 34,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non20",
      color: Colors.white,
      position: 35,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non21",
      color: Colors.white,
      position: 36,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non22",
      color: Colors.white,
      position: 37,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non23",
      color: Colors.white,
      position: 38,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non24",
      color: Colors.white,
      position: 39,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non25",
      color: Colors.white,
      position: 40,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non26",
      color: Colors.white,
      position: 41,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non27",
      color: Colors.white,
      position: 42,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non28",
      color: Colors.white,
      position: 43,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non29",
      color: Colors.white,
      position: 44,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non30",
      color: Colors.white,
      position: 45,
      boxColor: bCs[0],
    ),
    Piece(
      name: "Non31",
      color: Colors.white,
      position: 46,
      boxColor: bCs[1],
    ),
    Piece(
      name: "Non32",
      color: Colors.white,
      position: 47,
      boxColor: bCs[0],
    ),
    Piece(
      name: "blPawn1",
      color: Colors.black,
      position: 48,
      boxColor: bCs[0],
    ),
    Piece(
      name: "blPawn2",
      color: Colors.black,
      position: 49,
      boxColor: bCs[1],
    ),
    Piece(
      name: "blPawn3",
      color: Colors.black,
      position: 50,
      boxColor: bCs[0],
    ),
    Piece(
      name: "blPawn4",
      color: Colors.black,
      position: 51,
      boxColor: bCs[1],
    ),
    Piece(
      name: "blPawn5",
      color: Colors.black,
      position: 52,
      boxColor: bCs[0],
    ),
    Piece(
      name: "blPawn6",
      color: Colors.black,
      position: 53,
      boxColor: bCs[1],
    ),
    Piece(
      name: "blPawn7",
      color: Colors.black,
      position: 54,
      boxColor: bCs[0],
    ),
    Piece(
      name: "blPawn8",
      color: Colors.black,
      position: 55,
      boxColor: bCs[1],
    ),
    Piece(
      name: "blRook",
      color: Colors.black,
      position: 56,
      boxColor: bCs[1],
    ),
    Piece(
      name: "blHorse",
      color: Colors.black,
      position: 57,
      boxColor: bCs[0],
    ),
    Piece(
      name: "blBishop",
      color: Colors.black,
      position: 58,
      boxColor: bCs[1],
    ),
    Piece(
      name: "blQueen",
      color: Colors.black,
      position: 59,
      boxColor: bCs[0],
    ),
    Piece(
      name: "blKing",
      color: Colors.black,
      position: 60,
      boxColor: bCs[1],
    ),
    Piece(
      name: "blBishop2",
      color: Colors.black,
      position: 61,
      boxColor: bCs[0],
    ),
    Piece(
      name: "blHorse2",
      color: Colors.black,
      position: 62,
      boxColor: bCs[1],
    ),
    Piece(
      name: "blRook2",
      color: Colors.black,
      position: 63,
      boxColor: bCs[0],
    ),
  ];
  for (var x in ps) {
    db.collection("game").doc(gameId).collection("Pieces").doc(x.name).set({
      "name": x.name,
      "position": x.position,
      "color": x.color.toString().substring(6, x.color.toString().length - 1),
      "boxColor":
          x.boxColor.toString().substring(6, x.color.toString().length - 1),
    });
  }
  return ps;
}

GetPiece(snapshot) {
  List<Piece> team = [];
  for (var x in snapshot.data!.docs) {
    team.add(Piece(
        name: x["name"],
        boxColor: Color(int.parse(x["boxColor"])),
        position: x["position"],
        color: Color(int.parse(x["color"]))));
  }
  return team;
}

MoveAction(Piece piece, Piece piece2,FirebaseFirestore db,gameId,isMyTurn ) {
    db.collection("game").doc(gameId).collection("Pieces").doc(piece.name).update({
      "position": piece2.position,
      "boxColor":piece2.boxColor.toString().substring(6, piece2.color.toString().length - 1),
    });
    db.collection("game").doc(gameId).collection("Pieces").doc(piece2.name).update({
      "position": piece.position,
      "boxColor":piece.boxColor.toString().substring(6, piece.color.toString().length - 1),
    });
    db.collection("game").doc(gameId).update({
    "myTurn":isMyTurn,
  });
}
