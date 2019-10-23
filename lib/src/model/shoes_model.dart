import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class ShoesModel {
  ShoesModel({
    this.colors,
    this.imgUrl,
    this.name,
    this.price,
  });


  final List<Color> colors;
  final String imgUrl;
  final String name;
  final String price;



}

class BrandShoes {
  BrandShoes({
    this.id,
    this.names,
    this.list,
  });

  final int id;
  final String names;
   List<ShoesModel> list;
}