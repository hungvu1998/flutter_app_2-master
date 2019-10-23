import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/dog_bloc.dart';
import 'package:flutter_app/src/bloc/shoes_bloc.dart';

import 'package:flutter_app/src/resources/home_page.dart';
import 'package:flutter_app/src/resources/home_page2.dart';
import 'package:flutter_app/src/resources/main_page.dart';
import 'package:flutter_app/src/resources/detail_product.dart';

//class MyApp extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: DetailProduct(),
//    );
//  }
//
//
//}
class MyApp extends InheritedWidget {
  final DogBloc dogBloc;
  final ShoesBloc shoesBloc;
  final Widget child;
  MyApp(this.dogBloc,this.shoesBloc, this.child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static MyApp of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyApp);
  }
}
