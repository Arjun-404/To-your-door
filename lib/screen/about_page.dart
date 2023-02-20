import 'package:flutter/material.dart';
import 'package:to_your_door/const/colors.dart';
import 'package:to_your_door/screen/home_page.dart';

import 'package:to_your_door/utils/helper.dart';

class AboutPage extends StatefulWidget {
  static const routeName = "/introScreen";



  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var _controller;
  late int count;
  final List<Map<String, String>> _pages = [
    {
      "image": "foodulove.png",
      "title": "No Minimum Order",
      "desc":
      "Order in for yourself or for the group, with no restrictions on order value"
    },
    {
      "image": "foods1.png",
      "title": "Live Order Tracking",
      "desc": "Know where your order is at all times, from the restaurant to your doorstep"
    },
    {
      "image": "foods2.png",
      "title": "Lightning-Fast Delivery",
      "desc":
      "Experience To!your door's superfast delivery for food delivered fresh & on time"
    },
  ];

  @override
  void initState() {
    _controller = new PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("About Us",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontStyle: FontStyle.italic)),
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage()));
        },
          icon: Icon(Icons.arrow_back,color: Colors.black),),
      ),
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: 400,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        count = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset("assets/logo.png");
                    },


                    itemCount: _pages.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                      count == 0 ? AppColor.red : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                      count == 1 ? AppColor.red : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                      count == 2 ? AppColor.red : AppColor.placeholder,
                    )
                  ],
                ),
                Spacer(),
                Text(
                  _pages[count]["title"]!,
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text(
                  _pages[count]["desc"]!,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,

                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}