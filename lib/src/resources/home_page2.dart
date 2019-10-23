import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/shoes_bloc.dart';
import 'package:flutter_app/src/model/shoes_model.dart';
import 'package:flutter_app/src/resources/item_shoes.dart';
import 'package:flutter_app/src/resources/widget/brand_selector.dart';
import 'package:flutter_app/src/resources/widget/product_banner.dart';
import 'package:flutter_app/src/resources/widget/profile_clipper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_database/firebase_database.dart';

import '../app.dart';
class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

  var shoesBloc;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    shoesBloc=MyApp.of(context).shoesBloc;
    //shoesBloc.readData();
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
               child: StreamBuilder(
                 stream: shoesBloc.brandStream,
                 builder: (context,snapshot){
                   if(snapshot.hasData){
                     return BrandSelector(
                       brands: snapshot.data,
                     );
                   }
                   else{
                     return Container(
                         child: Center(
                           child: CircularProgressIndicator(),
                         ),
                       );
                   }
                 },
               )
             ),
           ],
         ),
      ),
    );
  }
}
