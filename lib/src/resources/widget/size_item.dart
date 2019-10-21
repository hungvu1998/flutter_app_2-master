import 'package:flutter/material.dart';
import 'package:flutter_app/src/util/utils.dart';

Widget SizeItem(String size, bool isSelected,BuildContext context){
  return Padding(
    padding:  EdgeInsets.only(
      left: 15.0,
    ),
    child: Container(
      width: screenAwareSize(30.0, context),
      height: screenAwareSize(30.0, context),
      decoration: BoxDecoration(
        color:isSelected? Color(0xFFFC3930) : Color(0xFF525663),
        borderRadius: BorderRadius.circular(5.0) ,
        boxShadow: [
          BoxShadow(
            color: isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
              offset: Offset(0.0,10.0),
            blurRadius: 10.0
          )
        ]
      ),
      child: Center(
        child: Text(size,
          style: TextStyle(color: Colors.white,fontFamily:"Montserrat-Bold"),
        ),
      ),
    ),
  );
}