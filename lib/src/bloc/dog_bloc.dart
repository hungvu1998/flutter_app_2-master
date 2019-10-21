import 'dart:async';
import 'dart:math';

import 'package:flutter_app/src/model/dog_model.dart';
import 'package:flutter_app/src/repository/place_service.dart';




class DogBloc {
  var _dogController = StreamController<List<DogModel>>.broadcast();
  List<DogModel> list=new List();
  Stream get dogStream => _dogController.stream;

  DogBloc() {
   getName();
  }
  void getName(){


    DogService.getName().then((rs){
      for(var item in rs){
        getImage(item,rs.length);
      }

    }).catchError((erro){
      print(erro.toString());
   
  });
  }
  void getImage(String breedName,int length){

    DogService.getImageByName(breedName).then((rs){
      list.add(DogModel(breedName,rs));
      if(list.length == length)
        _dogController.sink.add(list);
    }).catchError((err){
      print("error"+err.toString());
    });
  }
  void dispose(){
    print("ff");
    _dogController.close();

  }
}