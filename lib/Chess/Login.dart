import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testd/Chess/Api/FireBase.dart';
import 'package:testd/Chess/PlayScreen.dart';
import 'package:testd/Chess/WelcoomScreen.dart';
import 'package:testd/components/button.dart';
import 'Components/LoginSignUpContainaer.dart';
import 'Components/WelcomContainer.dart';

class Login extends StatefulWidget {
  static final String id = "Login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailCr=TextEditingController();
  var passCr=TextEditingController();
  var userName=TextEditingController();
  bool isLogin=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FireBase.fireBase.getCurrentUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(63, 104, 146, 1.0),
                    Color.fromRGBO(80, 97, 135, 1.0),
                Color.fromRGBO(154, 154, 203, 1.0),


              ])),
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                buildWelcomeContainer(),
                Center(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: isLogin?400:480,
                    width: 300,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 260,
                              height: 70,
                              child: button(
                                  myfun: () {
                                    Navigate(context);
                                  },
                                  bcolor: Color.fromRGBO(26, 57, 90, 1.0),
                                  textcolor: Colors.white,
                                  text: isLogin?"Login":"Signup"),
                            )),
                        buildLoginContainer(emailCr,passCr,userName,fun,isLogin),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(26, 57, 90, 1.0),
                            ),
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fun(){
    isLogin=!isLogin;
    setState(() {});
  }

  void Navigate(context) {

    if(isLogin)
      FireBase.fireBase.FireBaseLogin(emailCr.text, passCr.text, context);
    else
      FireBase.fireBase.FireBaseSignUp(emailCr.text, passCr.text,userName.text ,context);


  }
}



