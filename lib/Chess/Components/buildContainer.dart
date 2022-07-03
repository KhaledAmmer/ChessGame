import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class buildContainer extends StatefulWidget {
  @override
  _buildContainerState createState() => _buildContainerState();
}

class _buildContainerState extends State<buildContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.2),
      ),
      child: Stack(
        children: [
          container(context, Alignment.bottomCenter,Colors.black.withOpacity(0.5),1),
          container(context, Alignment.topCenter,Colors.white.withOpacity(0.5),2),
          circle(Alignment(-0.90, -.95), "rook", Colors.black),
          circle(Alignment(-0.75, -0.8), "horse", Colors.black),
          circle(Alignment(-0.5, -0.7), "bishop", Colors.black),
          circle(Alignment(-0.2, -0.6), "queen", Colors.black),
          circle(Alignment(0.2, -0.6), "king", Colors.black),
          circle(Alignment(0.5, -0.7), "bishop", Colors.black),
          circle(Alignment(0.75, -0.8), "horse", Colors.black),
          circle(Alignment(0.9, -.95), "rook", Colors.black),
          circle(Alignment(0.1, -0.75), "pawn", Colors.black),
          circle(Alignment(0.1, -0.95), "pawn", Colors.black),
          circle(Alignment(-0.1, -0.95), "pawn", Colors.black),
          circle(Alignment(0.4, -0.9), "pawn", Colors.black),
          circle(Alignment(-0.1, -0.75), "pawn", Colors.black),
          circle(Alignment(-0.4, -0.9), "pawn", Colors.black),
          circle(Alignment(0.3, -0.8), "pawn", Colors.black),
          circle(Alignment(-0.3, -0.8), "pawn", Colors.black),

          circle(Alignment(-0.97, 1), "rook", Colors.white),
          circle(Alignment(-0.85, .85), "horse", Colors.white),
          circle(Alignment(-0.6, 0.75), "bishop", Colors.white),
          circle(Alignment(-0.2, 0.6), "queen", Colors.white),
          circle(Alignment(0.2, 0.6), "king", Colors.white),
          circle(Alignment(0.6, 0.75), "bishop", Colors.white),
          circle(Alignment(0.85, .85), "horse", Colors.white),
          circle(Alignment(0.97, 1), "rook", Colors.white),
          circle(Alignment(0.35, .85), "pawn", Colors.white),
          circle(Alignment(0.45, .96), "pawn", Colors.white),
          circle(Alignment(-0.35, .85), "pawn", Colors.white),
          circle(Alignment(-0.45, .96), "pawn", Colors.white),
          circle(Alignment(-0.1, 1), "pawn", Colors.white),
          circle(Alignment(0.1, 1), "pawn", Colors.white),
          circle(Alignment(-0.1, 0.8), "pawn", Colors.white),
          circle(Alignment(0.1, 0.8), "pawn", Colors.white),
        ],
      ),
    );
  }
}

container(context, algin,color,n) {
  return Align(
      alignment: algin,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3.5,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular( n==1?MediaQuery.of(context).size.width:0.0),
                topRight: Radius.circular( n==1?MediaQuery.of(context).size.width:0.0),
                bottomRight: Radius.circular( n==2?MediaQuery.of(context).size.width:0.0),
                bottomLeft: Radius.circular( n==2?MediaQuery.of(context).size.width:0.0),
            )

        ),

      ),

  );
}

circle(align, name, color) {
  return AnimatedAlign(
    duration: Duration(seconds: 1),
    alignment: align,
    child: Container(
      height: 60,
      width: 60,
      child: SvgPicture.asset("assets/images/$name.svg",
          color: color,
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator())),
    ),
  );
}
