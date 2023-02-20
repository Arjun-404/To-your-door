import 'package:flutter/material.dart';
import 'package:to_your_door/screen/home_page.dart';

class OrderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Orders",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontStyle: FontStyle.italic)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage()));
        },
         icon: Icon(Icons.arrow_back,color: Colors.red),),
      ),
      body: Center(
        child: Text("No orders Yet",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
