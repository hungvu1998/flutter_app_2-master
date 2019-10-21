import 'package:flutter/material.dart';
import 'package:flutter_app/src/resources/detail_product.dart';
import 'package:flutter_app/src/util/utils.dart';

class ProductScreenTopPart extends StatefulWidget {
  final String imgUrl;

  const ProductScreenTopPart({Key key, this.imgUrl}) : super(key: key);
  @override
  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    var imgUrl=widget.imgUrl.toString();
    return Container(
      width: double.infinity,
      height: screenAwareSize(245.0, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  imgUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0,right: 35.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50.0, context),
                    height: screenAwareSize(50.0, context),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("360.png"),
                  ),
                ),
              )
            ],
          ),
          Positioned( 
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(15, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Rating",
                style: TextStyle(
                  color: Color(0xFF949598),
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: "Montserrat-Bold"
                ),
                ),
                SizedBox(
                  height: screenAwareSize(8.0, context),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(Icons.star,color: Color(0xFFFFE600),),
                    SizedBox(width: screenAwareSize(5.0, context),),
                    Text("4.5",style: TextStyle(color: Color(0xFFFFE600)),),
                    SizedBox(width: screenAwareSize(5.0, context),),
                    Text("(378 People)",style: TextStyle(color: Colors.white,fontSize: 14.0),),

                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
