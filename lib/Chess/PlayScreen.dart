import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Api/api.dart';
import 'Components/chessBoard.dart';
import 'Components/userCard.dart';
import 'Modle/buildGame.dart';

class PlayScreen extends StatefulWidget {
  static final String id = "play";
  final gameId;
  final plyerNum;
  final userName;
  PlayScreen({this.gameId = "2", this.plyerNum = 1,this.userName});

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  var db = FirebaseFirestore.instance;
  var widthScreen = 50.0;
  var isFirst = true;
  String ply2 ="non";

  List<Color> boxColors = [
    Color.fromRGBO(125, 137, 111, 1.0),
    Color.fromRGBO(96, 149, 119, 1.0),
  ];

  @override
  void initState() {
    super.initState();

    if (widget.plyerNum == 1) {
      CreatePieceApi(db, widget.gameId);
    }
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(32, 32, 38, 0.7764705882352941),
                  Color.fromRGBO(113, 123, 134, 1.0),
                  Color.fromRGBO(68, 79, 90, 1.0),
                ]),
            border: Border.all(width: 1,color: Colors.black)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ply2!="non"?userCard(ply2,"https://cdn.theathletic.com/app/uploads/2021/06/20145742/messi-barcelona-1024x683.jpg"):Center(child: CircularProgressIndicator()),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                color: Colors.black.withOpacity(0.6),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AlignLetter(context,1),
                      Container(
                        child:Padding(
                          padding: const EdgeInsets.only(right: 2,left: 1),
                          child: StreamBuilder(
                            stream: db
                                .collection("game")
                                .doc(widget.gameId)
                                .collection("Pieces")
                                .orderBy("position", descending: false)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                              Widget rows=Container();

                              if (snapshot.hasData) {
                                rows = BuildGame(
                                    GetPiece(snapshot), widget.plyerNum, widget.gameId) ;
                                FirebaseFirestore.instance.collection("game").doc(widget.gameId).get().then((value) {
                                  value.data()!.forEach((key, value) {
                                    if(key=="2ndPlayer" && value!="Non34"){
                                      ply2= value.toString();
                                    }
                                  });
                                });

                              } else if (snapshot.hasError) {
                                return Container();
                              } else
                                return Container();
                              return  rows;
                            },
                          ),
                        ),
                      ),
                      AlignLetter(context,2),
                    ],
                  ),
                  buildAlign(context,Alignment.topLeft),
                  buildAlign(context,Alignment.topRight),
                ],
              ),
            ),
            userCard(widget.userName,"https://cdn.theathletic.com/app/uploads/2021/06/20145742/messi-barcelona-1024x683.jpg"),
          ],
        ),


      ),
    );
  }






}
