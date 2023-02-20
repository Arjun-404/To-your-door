import 'package:flutter/material.dart';
class CategoriesCard extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String rating;
  final Function() onTap;
  CategoriesCard({required this.onTap, required this.image, required this.name, required this.price, required this.rating});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
        decoration: BoxDecoration(
        boxShadow: [
        BoxShadow(
        blurRadius: 20.0,
          color: Colors.grey.shade300
        ),],),
          child:
          Container(
        decoration: BoxDecoration(
        border: Border.all(width: 5,color:Colors.white),
        borderRadius: BorderRadius.circular(20),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[ SizedBox(
                height: 200,
                width: double.infinity,
                child:  ClipRRect( borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                  child: Image.network(image,
                    fit: BoxFit.cover,),
                ),
              ),
                SizedBox(
                  height: 4,
                ),
                Padding(padding: EdgeInsets.symmetric(
                    horizontal: 20),
                  child: Column(children: [
                    Row(
                      children: [

                        Text(name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700 ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("\$ $price",style: TextStyle(fontWeight: FontWeight
                            .bold,color: Colors.grey.shade700),),

                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
            Padding(padding: EdgeInsets.symmetric(
                horizontal: 1),
              child: Column(children: [
              Row(
              children: [
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.red,
                    ),
                    SizedBox(width: 2,),
                    Text(rating,style: TextStyle(color: Colors.red),),
                  ],
              ), SizedBox(
                  height: 3,
                ), ],
              ),
            ),

        ],),),
              ],),
          ),
        ),
      ),

    );

  }
}

