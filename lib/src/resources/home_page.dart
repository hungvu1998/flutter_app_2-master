import 'package:flutter/material.dart';
import 'package:flutter_app/src/app.dart';
import 'package:flutter_app/src/bloc/dog_bloc.dart';
import 'package:flutter_app/src/model/dog_model.dart';
import 'package:flutter_app/src/resources/page_transformer.dart';

import '../data.dart';
import '../intro_page_item.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() {

    return _HomePageState();
  }
  @override
  StatefulElement createElement() {
    return super.createElement();
  }
}

class _HomePageState extends State<HomePage> {
  var dogBloc;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _pageController = PageController(viewportFraction: 0.85);


  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    dogBloc=MyApp.of(context).dogBloc;
   return Container(
        child: StreamBuilder(
          stream: dogBloc.dogStream,
          builder: (context,snapshot){
            if(snapshot.hasData || dogBloc.list.length >0){
              List<DogModel> namesdog;
              if(dogBloc.list.length >0){
                namesdog = dogBloc.list;
              }
              else{
                 namesdog= snapshot.data;
              }

              final sampleItems = <IntroItem>[];
              for(var item in namesdog){
                sampleItems.add(new IntroItem(category: item.breedName,imageUrl: item.img[0]));
              }
              return Scaffold(
                key: _scaffoldKey,
                body: Container(
                  constraints: BoxConstraints.expand(),
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Column(
                          children: <Widget>[
                             AppBar(
                              title: Text("Dog Api"),
                              leading: FlatButton(
                                onPressed: (){
                                  _scaffoldKey.currentState.openDrawer();
                                },
                                child: Icon(Icons.menu),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Center(
                                child: SizedBox.fromSize(
                                  size: const Size.fromHeight(700),
                                  child: PageTransformer(
                                    pageViewBuilder: (context, visibilityResolver) {
                                      return PageView.builder(
                                        controller: _pageController,
                                        itemCount: namesdog.length,
                                        itemBuilder: (context, index) {
                                          final item = namesdog[index];
                                          final pageVisibility =
                                          visibilityResolver.resolvePageVisibility(index);
                                          return IntroPageItem(
                                            item: item,
                                            pageVisibility: pageVisibility,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                drawer: Drawer(
                  child: ListView.separated(
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Text(namesdog.elementAt(index).breedName),
                        onTap: (){
                          _pageController.jumpToPage(index);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    separatorBuilder: (context,index) => Divider(
                      height: 1,
                      color: Color(0xfff5f5f5),
                    ),
                    itemCount: namesdog.length,
                  ),
                ),
              );
            }
            else if(snapshot.hasError){
              print("has erro");
              return Scaffold(
                body: Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            else {
              return Scaffold(
                body: Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
          },
        ),
      );
  }

//  @override
//  void deactivate() {
//
//  }
//
//  @override
//  void didChangeDependencies() {
//
//  }



}


