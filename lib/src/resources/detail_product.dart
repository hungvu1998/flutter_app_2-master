import 'package:flutter/material.dart';
import 'package:flutter_app/src/model/shoes_model.dart';
import 'package:flutter_app/src/util/utils.dart';

import 'product_screen_bottom.dart';
import 'product_screen_top_part.dart';

class DetailProduct extends StatefulWidget {
  final ShoesModel shoes;

  const DetailProduct({Key key, this.shoes}): super(key: key);
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  var shoes;
  @override
  Widget build(BuildContext context) {
     shoes = widget.shoes;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF696D77),
            Color(0xFF292C36),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,size: screenAwareSize(20.0, context),),
            onPressed: (){
              Navigator.of(context).pop();
            },
            
          ),
        title: Text("Energy Cloud",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenAwareSize(18.0, context),
            fontFamily: "Montserrat-Bold"
          ),
        ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: screenAwareSize(20.0, context),
                color: Colors.white,
              ),
            )
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProductScreenTopPart(imgUrl: shoes.imgUrl,),
              ProductScreenBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
