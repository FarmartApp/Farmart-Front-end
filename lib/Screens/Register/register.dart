import 'package:flutter/material.dart';
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only( top:50.0),
                  child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.green),)
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only( top:5.0),
                child:  Image.asset("assets/signup.jpg",height: size.height*0.4),
              ),
              Container(
                child:  TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Full Name",
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
              SizedBox(height: 20.0,),
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
              SizedBox(height: 20.0,),
              Container(
                child:  TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Address",
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
              SizedBox(height: 20.0,),
              Container(
                child:  TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Email Address",
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
                  child: RaisedButton(onPressed: (){
                    print("clicked");
                  },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),

                    ),
                    child: Text("Register",style: TextStyle(color: Colors.white),
                    )
                    ,
                  )
              ),


            ]
        )
    );
  }
}
