import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/model/shoes_model.dart';
import 'package:flutter_app/src/resources/item_shoes.dart';
import 'package:flutter_app/src/resources/widget/brand_selector.dart';
import 'package:flutter_app/src/resources/widget/product_banner.dart';
import 'package:flutter_app/src/resources/widget/profile_clipper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {


  final _product = <ShoesModel>[
    new ShoesModel(colors: [Colors.white,Colors.red],imgUrl: "red.png",name: "Adidas Shoes 1",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.indigoAccent],imgUrl: "blue.png",name: "Adidas Shoes 2",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.amber],imgUrl: "vang.png",name: "Adidas Shoes 3",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.pinkAccent],imgUrl: "pink.png",name: "Adidas Shoes 4",price: "325"),

  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1125,
      height: 2346,
      allowFontScaling: true
    )..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Padding(
               padding: EdgeInsets.only(
                 top:ScreenUtil().setHeight(40),
                 left: ScreenUtil().setWidth(40),
                 right: ScreenUtil().setWidth(40),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   IconButton(
                     icon: Icon(Icons.menu),
                     onPressed: (){

                     },
                   ),
                   ClipOval(
                     clipper: ProfileClipper(),
                     child: Image.asset(
                       "assets/1.png",
                       width: ScreenUtil().setWidth(160),
                       height: ScreenUtil().setHeight(160),
                       fit: BoxFit.cover,
                     ),
                   ),

                 ],
               ),
             ),

             Padding(
               padding:  EdgeInsets.only(
                 top: ScreenUtil().setHeight(60),
                 left: ScreenUtil().setWidth(70),
                 right: ScreenUtil().setWidth(105),
               ),
               child: Text("Explore",
               style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold
               ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(0,20,0,0),
               child: BrandSelector(
                 brands: ["Adidas","Nike","Converse","Vans"],
               ),
             ),
             SizedBox(
               height: ScreenUtil().setHeight(1050),
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   physics: BouncingScrollPhysics(),
                   itemCount: _product.length,
                   itemBuilder: (context,index){
                     ShoesModel shoes = _product[index];
                     return Padding(
                       padding: EdgeInsets.only(
                         left: ScreenUtil().setWidth(30),
                       ),
                       child: ProductCard(shoes: shoes, cardNum: index),
                     );
                   }
               ),
             ),
             SizedBox(
               height: ScreenUtil().setHeight(60),
             ),
             ProductBanner(
               shoes: _product[3]
             )
           ],
         ),
      ),
    );
  }
}
