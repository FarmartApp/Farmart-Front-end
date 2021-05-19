import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadPageExample extends StatefulWidget {
  UploadPageExample({Key key, this.url}) : super(key: key);
  final String url;

  @override
  _UploadPageExampleState createState() => _UploadPageExampleState();
}

class _UploadPageExampleState extends State<UploadPageExample> {
  File file;
  //var serverReceiverPath = "https://www.developerlibs.com/upload";

  Future<String> uploadImage(filename) async {
    String usertoken =
        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1IiwiaWF0IjoxNjIxMjY5ODg2LCJleHAiOjE2MzY4MjE4ODZ9.tHZp2iv-Qdsv2kMuhxATjXtLGHshJlyL66LUQT4yDHQVE8yNJl90K-EspCxF1EO09ZTe0NF2tuDs3TlwEwZV3g";

    var serverReceiverPath = "http://192.168.43.118:9000/api/users/avatar";
    Map<String, String> headers = {
      "Content-type": "multipart/form-data",
      HttpHeaders.authorizationHeader: "Bearer $usertoken"
    };
    var request = http.MultipartRequest('POST', Uri.parse(serverReceiverPath));
    request.files.add(await http.MultipartFile.fromPath("avatar", filename));
    request.headers.addAll(headers);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    return response.reasonPhrase;
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
                        print(res);
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
