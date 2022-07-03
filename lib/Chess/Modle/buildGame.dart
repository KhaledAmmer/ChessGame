import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testd/Chess/Api/FireBase.dart';
import 'package:testd/Chess/Api/api.dart';
import 'package:testd/Chess/Components/BuildSvgImage.dart';
import 'package:testd/Chess/moveAction/moveActions.dart';
import 'Piece.dart';

class BuildGame extends StatefulWidget {
  late List<Piece> piece;
  final plyerNum;
  final gameId;

  BuildGame(this.piece, this.plyerNum, this.gameId);

  @override
  _BuildGameState createState() => _BuildGameState();
}

class _BuildGameState extends State<BuildGame> {
  var db = FirebaseFirestore.instance;
  List<Color> dBoiesColor = [];
  int clickedBox = -1;
  List<Widget> ws = [];
  bool myTurn = true;
  Color? teamColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teamColor = widget.plyerNum == 1 ? Colors.white : Colors.black;
    for (var x in widget.piece) {
      dBoiesColor.add(x.boxColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    ws = widget.plyerNum == 1
        ? getRows(context)
        : getRows(context)
            .reversed
            .toList();
    return Container(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: ws),
    );
  }

  List<Widget> getRows(BuildContext context) {
    return [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContainer(56, 63, 2, context).toList()),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContainer(48, 55, 1, context).toList()),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContainer(40, 47, 2, context).toList()),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContainer(32, 39, 1, context).toList()),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContainer(24, 31, 2, context).toList()),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContainer(16, 23, 1, context).toList()),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContainer(8, 15, 2, context).toList()),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContainer(0, 7, 1, context).toList()),

    ];
  }

  Iterable<Widget> buildContainer(start, end, n, context) sync* {
    for (int i = start; i <= end; i++) {
      String name = GetPieceName(widget.piece[i]);
      yield GestureDetector(
        onTap: () {
          if (myTurn == true && widget.plyerNum == 1) {}
          ClickedBox(i, name,context);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 2,
            bottom: 2,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 9.5,
                height: MediaQuery.of(context).size.width / 9,
                decoration: BoxDecoration(
                  color: widget.piece[i].boxColor,
                ),
                child:buildSvg(widget.piece[i]) ,


              )
            ],
          ),
        ),
      );
    }
  }

  void ClickedBox(int i, String name,context) async {
    myTurn = await FireBase.fireBase.isMyTurn(widget.gameId);
    if ((widget.plyerNum == 1 && myTurn == true) ||
        (widget.plyerNum == 2 && myTurn == false)) {
      if (i == clickedBox) {
        widget.piece = setDefaultColor(dBoiesColor, widget.piece);
        clickedBox = -1;
        setState(() {});
      } else {
        if (widget.piece[i].boxColor ==
            Color.fromRGBO(232, 240, 243, 0.7372549019607844)) {
          widget.piece = setDefaultColor(dBoiesColor, widget.piece);
          MoveAction(widget.piece[clickedBox], widget.piece[i], db,
              widget.gameId, !myTurn);
        } else {
          widget.piece = setDefaultColor(dBoiesColor, widget.piece);
          clickedBox = i;
          widget.piece[clickedBox].name.contains("wit")?widget.piece[clickedBox].boxColor=Colors.yellow.withAlpha(190):"";
          movingColor(widget.piece, i, name, widget.plyerNum,context,widget.gameId);
          setState(() {});
        }
      }
    }
  }


}
