import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testd/Chess/Components/Dialog.dart';
import 'package:testd/Chess/PlayScreen.dart';
import 'package:testd/components/button.dart';
import 'package:testd/components/textfiled.dart';

import 'Api/FireBase.dart';
import 'Components/LoginSignUpContainaer.dart';
import 'Components/buildContainer.dart';

class WelcomScreen extends StatelessWidget {
  static final String id = "wel";
   FirebaseAuth auth=FireBase.auth;
  var userName="";
  var idCr = TextEditingController();
  var gameId = "lk";
  var db = FirebaseFirestore.instance;
  getName()async{
    await db.collection("users").get().then((value) {
      for(var x in value.docs){
        if(x["id"]==auth.currentUser!.uid){
          userName=x["userName"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getName();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromRGBO(39, 39, 43, 1.0),
              Color.fromRGBO(146, 151, 156, 1.0),
              Color.fromRGBO(226, 226, 236, 1.0),
            ])),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: buildContainer(),
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                253, 252, 252, 0.30980392156862746),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(26, 57, 90, 1.0),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(2, 2)),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              startAGame(() {
                                buildDialog(context, idCr, () {
                                  StartGame(context, idCr.text, 1);
                                },"Create");
                              },
                                  context,
                                  "https://i.pinimg.com/originals/75/36/74/75367445ee7a3091c8e19c0f9b85aef4.jpg",
                                  "Create New Game",),

                              const SizedBox(
                                width: 5,
                              ),

                              startAGame(() {
                                buildDialog(context, idCr, () {
                                  StartGame(context, idCr.text, 2);
                                },"Join");
                              },
                                  context,
                                  "https://c4.wallpaperflare.com/wallpaper/484/357/194/artwork-fantasy-art-fantasy-girl-artstation-armored-hd-wallpaper-preview.jpg",
                                  "Join Game"),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector startAGame(fun, BuildContext context, url, text) {
    return GestureDetector(
      onTap: fun,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.3,
            width: MediaQuery.of(context).size.width / 2.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.fill)),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            width: MediaQuery.of(context).size.width / 2.2,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black54,
                border: Border.all(width: 1, color: Colors.black)),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  void StartGame(BuildContext context, gameId, num) async {
    var cheak = await FireBase.fireBase
        .CreateNewGame(num,userName, gameId, num == 1 ? false : true);
    print(cheak);
    if (cheak || num == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return PlayScreen(gameId: gameId, plyerNum: num,userName: userName,);
      }));
    }
  }
}
