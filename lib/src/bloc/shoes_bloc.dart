

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/model/shoes_model.dart';
import 'package:firebase_database/firebase_database.dart';
class ShoesBloc {
  final databaseReference = FirebaseDatabase.instance.reference();
  var _shoesTypeController = StreamController<List<BrandShoes>>();
  Stream get brandStream => _shoesTypeController.stream;
  List<BrandShoes> listBrand ;

  var shoesDetailController = StreamController<List<ShoesModel>>();
  Stream get shoesDetailStream => shoesDetailController.stream;

  ShoesBloc(){
    readData();
  }
  void readData(){
    print("hello");
    listBrand=  List();
    databaseReference.child("types").once().then((datasnapshot){
      for(var item in datasnapshot.value){
        var brandshoes = BrandShoes(id: item["id"],names: item["names"]);
        listBrand.add(brandshoes);
      }
      loadListShoesByIdBrand(listBrand[0].id);
      _shoesTypeController.add(listBrand);
    });
  }

  void loadListShoesByIdBrand(int id){
    print("cc");
    List<ShoesModel> listShoesDetail = List();
    shoesDetailController.add(listShoesDetail);
    databaseReference.child("shoes").child(id.toString()).once().then((datasnapshot){
      for(var item in datasnapshot.value){
         List<Color> listColor = List();
        for(var itemColor in item["colors"]){
          var color = int.parse(itemColor);
          listColor.add(Color(color));
        }
        var detailShoes = ShoesModel(name: item["name"],price: item["price"],imgUrl: item["imgUrl"],colors:  listColor);
         listShoesDetail.add(detailShoes);

      }
      shoesDetailController.add(listShoesDetail);

      for(int i=0;i<listBrand.length; i++){
        if(listBrand[i].id == id){
          listBrand[i].list = listShoesDetail;
          break;
        }
      }
      print(listShoesDetail.length);
    });

  }


  void dispose(){
    _shoesTypeController.close();
    shoesDetailController.close();
  }


}
