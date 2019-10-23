import 'package:flutter/material.dart';
import 'package:flutter_app/src/model/dog_model.dart';

class DetailDog extends StatelessWidget {
  final DogModel dogModel;

  const DetailDog({Key key, this.dogModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogModel.img.length,
          itemBuilder: (context,index){
            return Card(


                child: Material(
                  child: InkWell(
                    onTap: (){},
                    child: GridTile(
                      child: Image.network(dogModel.img[index]),
                    ),
                  ),
                ),

            );
          },
      ),
    );
  }
}
