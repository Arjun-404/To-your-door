import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_your_door/provider/my_provider.dart';
import 'package:to_your_door/screen/checkout_screen.dart';
import 'package:to_your_door/screen/home_page.dart';


class CartPage extends StatelessWidget {
  @override
 Widget cartItem({required String image,
    required String name,
    required int price,
    required Function() onTap,
    required int quantity}){
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5,color:Colors.white),
          borderRadius: BorderRadius.circular(20),),
        height: 110,
  width: 40,
  child:
  Row(
  children: [
  Expanded(
  child: Container(
  color: Colors.grey.shade300,
  width: 40,
  height: 110,
  child:Container(
      child:Image.network(image),
  ),
  ),
  ),
  Expanded(
  child: Stack(
  alignment: Alignment.topRight,
  children: [
  Container(
  color: Colors.grey.shade300,
  height: 170,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
    name,
  style: TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.bold),
  ),
  Text(
  " \$ $price",
  style: TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.bold),
  ),
  Row(
  children: [
  Text(" Quantity:"),
  SizedBox(
  width: 5,
  ),
  Text(quantity.toString(),
  style: TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold)),

  ],
  ),
  ],
  ),
  ),
  IconButton(onPressed: onTap ,
  icon: Icon(Icons.close,color: Colors.red,),
  ),
  ], ),
  ),
  ],
  ),
  ),
    );
  }


  Widget build(BuildContext context) {
    MyProvider provider=Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
              fontStyle: FontStyle.italic
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()
          ),);
          },
        ),
      ),
      body: ListView.builder(itemCount:provider.cartList.length,
      itemBuilder: (ctx,index){
        provider.getDeleteIndex(index);
        return cartItem(
          onTap:(){
            provider.delete();
          } ,
          image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price:provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
        );
      },
      ),

      bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(36.0),
    child: Container(
      height: 100,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: Colors.red,
    ),
    padding: const EdgeInsets.all(24),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Total Price',
    style: TextStyle(color: Colors.red[200]),
    ),

    const SizedBox(height: 8),
    // total price
    Text(
      "price",
    style: const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),
    ],
    ),

    // pay now
    Container(
    decoration: BoxDecoration(
    border: Border.all(color: Colors.green.shade200),
    borderRadius: BorderRadius.circular(28),
    ),
    padding: const EdgeInsets.all(12),
    child: Row(
    children:  [
    TextButton(
    onPressed: () { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CheckoutScreen())); },
    child: Text('Pay Now',
    style: TextStyle(color: Colors.white,fontSize: 10),
    ),
    ),
    Icon(
    Icons.arrow_forward_ios,
    size: 10,
    color: Colors.white,
    ),
    ],
    ),
    ),
    ],
    ),
    ),
      ),

      );
  }

}

