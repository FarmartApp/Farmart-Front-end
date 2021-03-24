import 'package:flutter/material.dart';

import 'Components/loginbody.dart';
import 'otp_ui.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                  margin: EdgeInsets.only( top:50.0),
                  child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.green),)
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only( top:5.0),
                  child:  Image.asset("assets/login1.png",width: size.width*0.8,height: size.height*0.6),
              ),
              Container(
                child:  TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Phone Number",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
              ),
              Container(
                width: size.width*0.4,
                margin: EdgeInsets.only(top: 30.0),
                child: RaisedButton(
                 onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                      return OTPLoginScreen();
                }
                )
                      );
                 },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  child: Text("Next",style: TextStyle(color: Colors.white),
                  )
                  ,
                )
                  ),


            ]
        )
    );
  }
}
