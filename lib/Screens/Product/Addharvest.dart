import 'package:flutter/material.dart';

class AddHarvestPage extends StatefulWidget {
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
  List<HarvestType> _harvestlist = HarvestType.gettypelist();
  List<DropdownMenuItem<HarvestType>> _dropdownharvest;
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
      body: ListView(
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
              decoration: InputDecoration(
                labelText: "Harvest Image",
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
                    onPressed: () {}),
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
    );
  }
}
