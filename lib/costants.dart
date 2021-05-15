import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

String tokenforuser;
const apiBase = 'http://192.168.43.118';
const kPrimaryColor = Colors.white;
const kPrimaryLightColor = Colors.greenAccent;
const kDefaultPadding = 20.0;
const kDefaultShadow =
    BoxShadow(offset: Offset(0, 15), blurRadius: 27, color: Colors.black12);
const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);

class District {
  int id;
  String districtname;

  District(this.id, this.districtname);
  static List<District> gettypelist() {
    return <District>[
      District(1, "Jaffna"),
      District(2, "Kilinochchi"),
      District(3, "Mannar"),
      District(4, "Mullaitivu"),
      District(5, "Vavuniya"),
      District(6, "Puttalam"),
      District(7, "Kurunegala"),
      District(8, "Gampaha"),
      District(9, "Colombo"),
      District(10, "Kalutara"),
      District(11, "Anuradhapura"),
      District(12, "Polonnaruwa"),
      District(13, "Matale"),
      District(14, "Kandy"),
      District(15, "Nuwara Eliya"),
      District(16, "Kegalle"),
      District(17, "Ratnapura"),
      District(18, "Trincomalee"),
      District(19, "Batticaloa"),
      District(20, "Ampara"),
      District(21, "Badulla"),
      District(22, "Monaragala"),
      District(23, "Hambantota"),
      District(24, "Matara"),
      District(25, "Galle"),
    ];
  }
}