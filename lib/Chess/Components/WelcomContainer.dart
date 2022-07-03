import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class buildWelcomeContainer extends StatelessWidget {
  final height;

  buildWelcomeContainer({this.height = 100.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Chess  ",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontSize: 40,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              "assets/images/owl.svg",
              width: 80,
              height: 80,
              color: Colors.white,
              placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}