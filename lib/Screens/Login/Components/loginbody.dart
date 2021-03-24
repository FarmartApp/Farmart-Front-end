import 'package:flutter/material.dart';

import 'login_background.dart';
class Body extends StatelessWidget {
  const Body({
    Key key,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold),),
          Image.asset("assets/login1.png"),


        ],
      ),
    );
  }
}
class LoginBody extends StatefulWidget {
  const LoginBody({
    Key key,
  }):super(key: key);
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: size.height*0.2,),
          Image.asset("assets/login.png",width: size.width*0.5,height: size.height*0.4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'
                ),

            )
            )



        ],
      ),
    );
  }
}
