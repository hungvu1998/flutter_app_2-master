import 'package:flutter/material.dart';
import 'package:flutter_app/src/app.dart';
import 'package:flutter_app/src/bloc/shoes_bloc.dart';
import 'package:flutter_app/src/model/shoes_model.dart';
import 'package:flutter_app/src/resources/widget/product_banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../item_shoes.dart';
class BrandSelector extends StatefulWidget {
  final List<BrandShoes> brands;
  BrandSelector({
    @required this.brands,
});
  @override
  _BrandSelectorState createState() => _BrandSelectorState();
}

class _BrandSelectorState extends State<BrandSelector> {
  int _currentIndex =0;
  bool _isSelected;
  var _product = <ShoesModel>[
    new ShoesModel(colors: [Colors.white,Colors.red],imgUrl: "red.png",name: "Adidas Shoes 1",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.indigoAccent],imgUrl: "blue.png",name: "Adidas Shoes 2",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.amber],imgUrl: "vang.png",name: "Adidas Shoes 3",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.pinkAccent],imgUrl: "pink.png",name: "Adidas Shoes 4",price: "325"),

  ];
  var _product2 = <ShoesModel>[
    new ShoesModel(colors: [Colors.white,Colors.red],imgUrl: "red.png",name: " Shoes 1",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.indigoAccent],imgUrl: "blue.png",name: " Shoes 2",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.amber],imgUrl: "vang.png",name: " Shoes 3",price: "325"),
    new ShoesModel(colors: [Colors.white,Colors.pinkAccent],imgUrl: "pink.png",name: " Shoes 4",price: "325"),

  ];
  var shoesBloc;

  @override
  void initState() {
    super.initState();

  }

  List<Widget>_buildShoesBrand(){
    shoesBloc= MyApp.of(context).shoesBloc;
    return widget.brands.map((brand){
      var index =widget.brands.indexOf(brand);
      _isSelected = _currentIndex == index;
      return Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(75),
        ),
        child: GestureDetector(
          onTap: (){
            setState(() {
              _currentIndex=index;
              if(brand.list ==null) {
                print("yoyoyoyoy");
                shoesBloc.loadListShoesByIdBrand(brand.id);
              }
              else {
               shoesBloc.shoesDetailController.add(brand.list);
              }
            });
          },
          child: Text(
            brand.names,
            style: TextStyle(
              color: _isSelected ? Colors.black : Colors.grey,
              fontSize: _isSelected ? 22 : 16,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(
            children: _buildShoesBrand(),
          ),
          StreamBuilder(
            stream: shoesBloc.shoesDetailStream,
            builder: (context,snapshot){
              if(snapshot.hasData){
                List<ShoesModel> listShoesDetail  = snapshot.data;
                if(listShoesDetail.length <=0){
                  print("length 0");
                  return  Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                else{
                  _product=snapshot.data;
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil().setHeight(1050),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: _product.length,
                            itemBuilder: (context,index){
                              ShoesModel shoes =  _product[index];
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
                          shoes:  _product[3]
                      )
                    ],
                  );
                }
              }
              else{
                print("length null");
                return  Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                );
              }
            },
          ),

        ],
    );
  }
}



