import 'package:flutter/material.dart';
import 'package:flutter_app/src/app.dart';
import 'package:flutter_app/src/bloc/dog_bloc.dart';
import 'package:flutter_app/src/resources/main_page.dart';


void main() {
 // runApp(MyApp());
  runApp(MyApp(
      new DogBloc(),
      MaterialApp(
        home: MainPage(),
      )));
}
