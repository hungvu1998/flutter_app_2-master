import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/model/data.dart';
import 'package:flutter_app/src/resources/widget/color_selector.dart';
import 'package:flutter_app/src/resources/widget/divider.dart';
import 'package:flutter_app/src/resources/widget/size_item.dart';
import 'package:flutter_app/src/util/utils.dart';

class ProductScreenBottom extends StatefulWidget {
  @override
  _ProductScreenBottomState createState() => _ProductScreenBottomState();
}

class _ProductScreenBottomState extends State<ProductScreenBottom> {

  bool isExpanded =false;
  int currentSizeIndex =0;
  int _counter =0;
  int currentColorIndex = 0;

  void _increase(){
    setState(() {
      _counter++;
    });
  }
  void _decrease(){
    if(_counter>0)
    setState(() {
      _counter--;
    });
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();

    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }

    return colorItemList;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text("Product Description",style: TextStyle(
                color: Color(0XFF949598),
                fontSize: screenAwareSize(10.0, context),
                fontFamily: "Montserrat-Bold",
            ),),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding:  EdgeInsets.only(left: screenAwareSize(26.0, context),right: screenAwareSize(18.0, context)),
            child: AnimatedCrossFade(
              firstChild: Text(desc,maxLines: 2,style: TextStyle(
                color: Colors.white,
                fontSize: screenAwareSize(10.0, context),
                fontFamily: "Montserrat-Bold",
              ),),
              secondChild: Text(desc,style: TextStyle(
                color: Colors.white,
                fontSize: screenAwareSize(10.0, context),
                fontFamily: "Montserrat-Bold",
              ),),
              crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: screenAwareSize(26.0, context),right: screenAwareSize(18.0, context)),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isExpanded ? isExpanded = false: isExpanded =true;
                });
              },
                child: Text(isExpanded?"less":"more..",style: TextStyle(
                  color: Color(0xFFFB382F),
                  fontWeight: FontWeight.w700,

                ),)
            ),
          ),
          SizedBox(
            height: screenAwareSize(12.0, context),
          ),
         Padding(
           padding: EdgeInsets.only(left: screenAwareSize(15.0, context),right: screenAwareSize(75.0, context)),
           child: Row
             (
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Text("Size",
                 style: TextStyle(
                   color: Color(0XFF949598),
                   fontFamily: "Montserrat-SemiBold",
                   fontSize: screenAwareSize(10.0, context),
                 ),),
               Text("Quantity",
                 style: TextStyle(
                   color: Color(0XFF949598),
                   fontFamily: "Montserrat-SemiBold",
                   fontSize: screenAwareSize(10.0, context),
                 ),),
             ],
           ),
         ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(20.0, context)),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(38.0, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumList.map((item){
                      var index = sizeNumList.indexOf(item);
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            currentSizeIndex = index;
                          });
                        },
                        child: SizeItem(item, index==currentSizeIndex, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(12.0),
                  child: Container(
                    width: screenAwareSize(100.0, context),
                    height: screenAwareSize(30.0, context),
                    decoration: BoxDecoration(
                      color: Color(0xFF525663),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _decrease,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text("-",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Montserrat-Bold"
                                ),),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text(_counter.toString(),style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: "Montserrat-Bold"
                                ),),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _increase,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text("+",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: "Montserrat-Bold"
                                ),),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(18.0, context)
            ),
            child: Text("select Color",style: TextStyle(
              color: Color(0xFF949598),
              fontSize: screenAwareSize(10.0, context),
              fontFamily: "Montserrat-SemiBold",
            ),),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Container(
            margin: EdgeInsets.only(
              left: screenAwareSize(20.0, context)
            ),
            width: double.infinity,
            height: screenAwareSize(34.0, context),
            child: Row(
              children: colorSelector(),
            ),
          ),
          SizedBox(
            height: screenAwareSize(6.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(20.0, context)
            ),
            child: Text("Price",style: TextStyle(
              color: Color(0xFF949598),
              fontFamily: "Montserrat-SemiBold",
            ),),
          ),
          Container(
            width: double.infinity,
            height: screenAwareSize(120.0, context),
            child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: screenAwareSize(22.0, context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenAwareSize(18.0, context)),
                          child: Row(
                            children: <Widget>[
                              Text("\$",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenAwareSize(26.0, context),
                                      fontFamily: "Montserrat-Medium")),
                              SizedBox(width: screenAwareSize(2.0, context)),
                              Text("80",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenAwareSize(35.0, context),
                                      fontFamily: "Montserrat-Medium")),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenAwareSize(10.0, context),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: MaterialButton(
                            color: Color(0xFFFB382F),
                            padding: EdgeInsets.symmetric(
                              vertical: screenAwareSize(14.0, context),
                            ),
                            onPressed: () {},
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: screenAwareSize(35.0, context)),
                                child: Text("Add To Cart",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        screenAwareSize(15.0, context))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: -40.0,
                    bottom: -60.0,
                    child: Image.asset("cart.png",
                        width: screenAwareSize(190.0, context),
                        height: screenAwareSize(155.0, context),
                        fit: BoxFit.cover),
                  ),
                ]

            ),
          )
        ],
      ),
    );
  }
}
