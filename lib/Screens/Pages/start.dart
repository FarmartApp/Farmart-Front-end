import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key key, this.url}) : super(key: key);
  final String url;

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File file;
  var url = "http://192.168.43.118:9000/api/users/avatar";

  Future<String> uploadImage(filepath) async {
    String usertoken =
        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1IiwiaWF0IjoxNjIxMTgyNTkzLCJleHAiOjE2MzY3MzQ1OTN9.fFb8sO_e9T6u_h4EbaIowAZq3SeKWIt1ITa1kmg7lfrSQFbyMdTayPrM8y-XWWnaA2mPWVuWs8Gm8BBRnfhhIA";
    Map<String, String> headers = {
      "Content-type": "multipart/form-data",
      HttpHeaders.authorizationHeader: "Bearer $usertoken"
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    //add text fields
    // request.fields["text_field"] = text;
    //create multipart using filepath, string or bytes
    request.files.add(http.MultipartFile('avatar',
        File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
        filename: filepath.split("/").last));
    // var pic = await http.MultipartFile.fromPath("avatar", file.path);
    //add multipart to request
    // request.files.add(pic);

    request.headers.addAll(headers);
    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter File Upload Example',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            file != null
                ? Container(
                    height: 160.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: ExactAssetImage(file.path),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.red, width: 5.0),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(20.0)),
                    ),
                  )
                : SizedBox(
                    width: 0.0,
                  ),
            SizedBox(
              height: 100.0,
            ),
            file != null
                ? RaisedButton(
                    child: Text("Upload Image"),
                    onPressed: () async {
                      var res = await uploadImage(file.path);
                      setState(() {
                        print(file.path);
                      });
                    },
                  )
                : SizedBox(
                    width: 50.0,
                  ),
            file == null
                ? RaisedButton(
                    child: Text("Open Gallery"),
                    onPressed: () async {
                      file = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {});
                    },
                  )
                : SizedBox(
                    width: 0.0,
                  )
          ],
        ),
      ),
    );
  }
}
