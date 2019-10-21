import 'package:flutter/material.dart';
import 'package:flutter_app/src/util/utils.dart';


Widget colorItem(Color color,bool isSelected ,BuildContext context,VoidCallback _onTab){
  return GestureDetector(
    onTap: _onTab,
    child: Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(10.0, context)
      ),
      child: Container(
        width: screenAwareSize(30.0, context),
        height: screenAwareSize(30.0, context),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: isSelected ? [
            BoxShadow(
              color:Colors.black.withOpacity(.8),
              blurRadius: 10.0,
              offset: Offset(0.0,10.0)
            )
          ] :[]
        ),
        child: ClipPath(
         clipper: MClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}
class MClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.0, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }

}