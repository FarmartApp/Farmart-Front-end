import 'package:flutter/material.dart';

import '../../../costants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, text_color;
  const RoundedButton(
      {Key key,
      this.text,
      this.press,
      this.color = kPrimaryColor,
      this.text_color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
            color: Colors.green,
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
