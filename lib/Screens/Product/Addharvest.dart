import 'dart:convert';

import 'package:farmart_flutter_app/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:farmart_flutter_app/costants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Img;

class AddHarvestPage extends StatefulWidget {
  final String token;

  const AddHarvestPage({Key key, this.token}) : super(key: key);
  @override
  _AddHarvestPageState createState() => _AddHarvestPageState();
}

class HarvestType {
  int id;
  String type;

  HarvestType(this.id, this.type);
  static List<HarvestType> gettypelist() {
    return <HarvestType>[
      HarvestType(1, "Vegetables"),
      HarvestType(2, "Fruits")
    ];
  }
}

class _AddHarvestPageState extends State<AddHarvestPage> {
  final _formkey = GlobalKey<FormState>();
  Product newproduct = new Product();
  List<HarvestType> _harvestlist = HarvestType.gettypelist();
  List<DropdownMenuItem<HarvestType>> _dropdownharvest;
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController isdeliveryController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  bool _isdelivery = false;
  bool _issold = false;
  File imageFile;
  String imageData;
  choiceImage() async {
    var pickedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageFile = pickedImage;
      });
      imageData = base64Encode(imageFile.readAsBytesSync());
      return imageData;
    } else {
      return null;
    }
  }

  showImage(String image) {
    return Image.memory(base64Decode(image));
  }

  void valuechanged(bool value) {
    setState(() {
      _isdelivery = value;
    });
  }

  HarvestType _selectedtype;
  @override
  void initState() {
    _dropdownharvest = buildDropdownMenuItems(_harvestlist);
    _selectedtype = _dropdownharvest[0].value;
    super.initState();
  }

  List<DropdownMenuItem<HarvestType>> buildDropdownMenuItems(List harvestlist) {
    List<DropdownMenuItem<HarvestType>> items = List();
    for (HarvestType harvesttype in harvestlist) {
      items.add(
        DropdownMenuItem(
          value: harvesttype,
          child: Text(harvesttype.type),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(HarvestType selectedHarvestType) {
    setState(() {
      _selectedtype = selectedHarvestType;
    });
  }

  Future<http.Response> addProduct() async {
    String protype = "sssss";
    int uid = 5;
    String id = uid.toString();
    String usertoken = widget.token;
    var url = apiBase + ":9000/api/product";
    var respose = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
      body: jsonEncode(<String, String>{
        'name': nameController.text,
        'price': priceController.text,
        'weight': weightController.text,
        'location': locationController.text,
        'deliveryAvailable': _isdelivery.toString(),
        'sold': _issold.toString(),
        'productType': '${_selectedtype.type}',
        'image': imageData
      }),
    );

    final res = json.decode(respose.body);
    if (respose.statusCode == 200) {
      /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => HomePage(
                    token: token,
                    user: user,
                  )));*/
      Fluttertoast.showToast(msg: "sucesssfully added");
    } else {
      Fluttertoast.showToast(msg: "Unable to add try again");
    }
    print(res);
    return respose;

    /*final responseJson = json.decode(response.body);
    String message = responseJson["msg"];
    print(response.body.toString());
  }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Image.asset("assets/harvest.jpg"),
              elevation: 30,
            ),
            Center(
              child: Text(
                "Add your harvest here",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Harvest Name",
                  fillColor: Colors.green,
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Harvest Name cannot be empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: "Harvest Weight",
                  fillColor: Colors.green,
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Harvest Weight cannot be empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: " Price",
                  fillColor: Colors.green,
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Price cannot be empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: "Location",
                  fillColor: Colors.green,
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Location cannot be empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10, right: 20, top: 10),
                child: CheckboxListTile(
                    title: Text("Is deleivery available"),
                    value: _isdelivery,
                    onChanged: (value) {
                      valuechanged(value);
                    })),

            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  children: [
                    Text("Upload Image"),
                    SizedBox(
                      width: 50,
                    ),
                    RaisedButton(
                        child: Text("Choose"),
                        onPressed: () {
                          choiceImage();
                          print(imageData);
                        })
                  ],
                )),
            imageData == null
                ? Text(
                    "Nothing to show",
                    style: TextStyle(color: Colors.red),
                  )
                : Container(
                    child: showImage(imageData),
                    height: 150,
                    width: 150,
                  ),
            //dropdown
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: DropdownButton(
                    value: _selectedtype,
                    items: _dropdownharvest,
                    onChanged: onChangeDropdownItem)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RaisedButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Save"),
                      onPressed: () {
                        //  newproduct.name = nameController.text;
                        print(widget.token);
                        addProduct();
                        print(imageData);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
