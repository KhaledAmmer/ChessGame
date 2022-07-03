import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testd/Chess/Modle/Piece.dart';
import 'package:testd/Chess/WelcoomScreen.dart';

class FireBase {
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FireBase fireBase = FireBase();

  getCurrentUser(context) async {
    var user = await auth.currentUser;
    if (user != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return WelcomScreen();
      }));
    }
  }

  FireBaseLogin(email, pass, context) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      if (userCredential != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return WelcomScreen();
        }));
      }
    } catch (e) {}
  }

  FireBaseSignUp(email, pass, userName, context) async {
    try {
      var userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (userCredential != null) {
        _CreateNewUser(userName, auth.currentUser!.uid);
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return WelcomScreen();
        }));
      }
    } catch (e) {}
  }

  _CreateNewUser(userName, currentUser) {
    _db.collection("users").add({
      "id": currentUser,
      "userName": userName,
    });
  }

  CreateNewGame(
    userNum,
    userName,
    gameId,
    myTurn,
  ) async {
    var cheak = false;
    if (userNum == 1) {
      _db.collection("game").doc(gameId).set({
        "id": gameId,
        "myTurn": myTurn,
        "1stPlyer": userName,
        "2ndPlayer": "Non34"
      });
      return cheak;
    } else {
      await _db.collection("game").get().then((value) {
        for (var x in value.docs) {
          if (x.get("id") == gameId) {
            _db.collection("game").doc(gameId).update({
              "2ndPlayer": userName,
              "myTurn": myTurn,
            });
            cheak = true;
          }
        }
      });
      return cheak;
    }
  }

  GetPieces(gameId) {
    List<Piece> ps = [];
    _db
        .collection("game")
        .doc(gameId)
        .collection("Pieces")
        .orderBy("position", descending: false)
        .get()
        .then((value) {
      for (var x in value.docs) {
        ps.add(Piece(
            name: x["name"],
            boxColor: Color(int.parse(x["boxColor"])),
            position: x["position"],
            color: Color(int.parse(x["color"]))));
      }
    });

    return ps;
  }

  Future<bool> isMyTurn(gameId) async {
    Map<String, dynamic>? x;
    await _db.collection("game").doc(gameId).get().then((value) {
      x = value.data();
    });
    return x!["myTurn"];
  }

  UpdatePieceName(PieceName, Piece piece, gameId) {
    _db
        .collection("game")
        .doc(gameId)
        .collection("Pieces")
        .doc(piece.name)
        .set({
      "name": piece.name,
      "position": piece.position,
      "color": piece.color
          .toString()
          .substring(6, piece.color.toString().length - 1),
      "boxColor": piece.boxColor
          .toString()
          .substring(6, piece.color.toString().length - 1),
    });
    _db
        .collection("game")
        .doc(gameId)
        .collection("Pieces")
        .doc(PieceName)
        .delete();
  }
}
