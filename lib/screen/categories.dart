import 'package:flutter/material.dart';
import 'package:to_your_door/models/food_categories_model.dart';
import 'package:to_your_door/screen/detail_page.dart';
import 'package:to_your_door/screen/home_page.dart';
import 'package:to_your_door/screen/widget/categories_card.dart';

class Categories extends StatelessWidget {
  List<FoodCategoriesModel> list = [];

  Categories({required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("What do you like?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.red,),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()),
            );
          },
        ),
        elevation: 0.0,
      ),
      body:   SingleChildScrollView(
    child: Column(
          children: list
              .map((e) => CategoriesCard(
            onTap:(){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailPage(
                image: e.image,
                name: e.name,
                price: e.price,
                rating:e.rating,
              ),
              ),
              );
            } ,
                    image: e.image,
                    price: e.price,
                    name: e.name,
                    rating: e.rating,
                  ))
              .toList()),
      ), );
  }
}
