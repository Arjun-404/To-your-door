import 'package:flutter/material.dart';
class BottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String rating;
  final Function() onTap;
  BottomContainer({required this.onTap, required this.image, required this.name, required this.price, required this.rating});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[ SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(image,
                  fit: BoxFit.cover,),
              ),
                SizedBox(
                  height: 5,
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
                     Text(" . ",style: TextStyle(fontWeight: FontWeight.bold),),
                     Icon(
                       Icons.star,
                       size: 15,
                       color: Colors.red,
                     ),
                     SizedBox(width: 2,),
                     Text(rating,style: TextStyle(color: Colors.red),),
                   ],
                 ),
                   ],
                 ),),
                 SizedBox(
                   height: 30,
                 ),
               ],),

               ),

    );

  }
}

