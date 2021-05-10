import 'package:farmart_flutter_app/Model/product.dart';
import 'package:farmart_flutter_app/Screens/Pages/DEtailViewPage.dart';
import 'package:flutter/material.dart';

 
class Cell extends StatelessWidget {
  const Cell(this.product);
  @required
  final Product product;
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       child: InkWell(
                            onTap: () {
                             /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailView()));*/

                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          "assets/fruits2.jpg",
                                          productobj.name,
                                          productobj.price.toString(),
                                          productobj.weight.toString(),
                                          productobj.id.toString())));*/
                            },
                            child: Card(
                              child: Stack(
                                children: [
                                  /* Hero(
                                      tag: productobj.id,
                                      child: Image(
                                          image: showImage(productobj.image))),*/
                                  Padding(
                                    padding: EdgeInsets.only(right: 5, top: 0),
                                    child: IconButton(
                                      color: Colors.grey[100],
                                      icon: Icon(Icons.favorite),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 100),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Text(
                                        product.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: Text(
                                          product.weight.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 120),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Text(
                                          product.price.toString(),
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 140, left: 30),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "Click to order",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      color: Colors.grey.withOpacity(0.1))),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
      ),
    );
  }
}