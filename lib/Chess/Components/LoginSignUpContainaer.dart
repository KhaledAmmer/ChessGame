import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testd/components/textfiled.dart';

buildLoginContainer(TextEditingController emailCr, TextEditingController passCr,TextEditingController  userName, fun, isLogin) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: AnimatedContainer(
      duration: Duration(seconds: 2),
      height: isLogin ? 310 : 380,
      width: 300,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(253, 252, 252, 0.7764705882352941),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(26, 57, 90, 1.0),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(2, 2)),
        ],
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Visibility(
          visible: !isLogin,
          child: textfiled1(
              fillcolor: Color.fromRGBO(26, 57, 90, 1.0),
              cor: userName,
              hint: "UserName",
              isPw: false,
              kt: TextInputType.text,
              prefix: Icons.person),
        ),
        textfiled1(
            fillcolor: Color.fromRGBO(26, 57, 90, 1.0),
            cor: emailCr,
            hint: "Emial",
            isPw: false,
            kt: TextInputType.text,
            prefix: Icons.email),
        textfiled1(
            fillcolor: Color.fromRGBO(26, 57, 90, 1.0),
            cor: passCr,
            hint: "Password",
            isPw: true,
            kt: TextInputType.text,
            prefix: Icons.remove_red_eye),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              !isLogin?"Back to?":"New User?", style: TextStyle(color: Colors.black, fontSize: 18.0),),
            TextButton(
              onPressed: () {
                fun();
                userName.text="";
                passCr.text="";
                emailCr.text="";
              },
              child: Text(isLogin ? "SignUp" : "Login",style: TextStyle(color: Colors.blueGrey,fontSize: 18.0),)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: AnimatedOpacity(
                opacity: isLogin ? 0 : 1,
                duration: Duration(seconds: 4),
                child: !isLogin ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Icon(
                      Icons.facebook, color: Color.fromRGBO(26, 57, 90, 1.0),
                      size: 45,)),
                    Expanded(child: Icon(
                      Icons.phone, color: Color.fromRGBO(26, 57, 90, 1.0),
                      size: 45,)),
                  ],
                ) : Container(),
              ),
            ),

          ],
        ),
      ),
    ),
  );
}
