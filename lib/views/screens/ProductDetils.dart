import 'package:flutter/material.dart';
import 'package:test1/Database/Services/products_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Database/model/product.dart';
import 'package:like_button/like_button.dart';

class ProductDetils extends StatefulWidget {
  final Product itemproduct;

  ProductDetils({Key? key, required this.itemproduct}) : super(key: key);

  @override
  _ProductDetilsState createState() =>
      _ProductDetilsState(itemproduct: itemproduct);
}

class _ProductDetilsState extends State<ProductDetils> {
  final Product itemproduct;

  _ProductDetilsState({required this.itemproduct});

  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF111631),
          title: Title(
              color: Color(0xFF7423A8),
              child: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.1, 5, 5, 5),
                  alignment: AlignmentDirectional.topCenter,
                  child: Text(
                    itemproduct.name.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF7423A8)
                    ),
                  ),
                ),
              ))),
      body: Container(
        height: height,
        width: widht,
        color: Color(0xFF111631),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: height * 0.35,
                      width: widht,
                      child: Image(
                        image: NetworkImage(itemproduct.image.toString()),
                        fit: BoxFit.fill,
                      )),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: LikeButton(
                      size: 50,
                      isLiked: itemproduct.meLike,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      circleColor: CircleColor(
                        start: Colors.red,
                        end: Colors.indigo,
                      ),
                      bubblesColor: BubblesColor(
                          dotPrimaryColor: Colors.black87,
                          dotSecondaryColor: Colors.pink,
                          dotLastColor: Colors.amberAccent,
                          dotThirdColor: Colors.blue),
                      bubblesSize: 30,
                      mainAxisAlignment: MainAxisAlignment.end,
                      likeCount: itemproduct.likes_count,
                    ),
                  ),
                ],
              ),
              ////////////////////////////////////
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.production_quantity_limits,
                                  color: Color(0xFF7423A8),
                                  size: 30,
                                )),
                            Text(
                              itemproduct.quantity.toString(),
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        )),
                    Center(
                      child: SizedBox(
                        width: widht * 0.25,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.price_change,
                                color: Color(0xFF7423A8),
                                size: 30,
                              )),
                          Text(
                            itemproduct.price.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.category_outlined,
                                color: Color(0xFF7423A8),
                                size: 30,
                              )),
                          Text(
                            itemproduct.category_id.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: widht * 0.25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  launch("tel:" + itemproduct.phone_number.toString());
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.phone,
                            color: Color(0xFF7423A8),
                            size: 30,
                          )),
                      GestureDetector(
                        onTap: () {
                          launch("tel:" + itemproduct.phone_number.toString());
                        },
                        child: Text(
                          itemproduct.phone_number.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.date_range_rounded,
                          color: Color(0xFF7423A8),
                          size: 30,
                        )),
                    Text(
                      itemproduct.exp_date.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

On_Like(Product item_product) async {
  await Products_Services.LikeProduct(
      id: item_product.id, number_of_replies: item_product.likes_count);
}
