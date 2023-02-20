import 'package:flutter/material.dart';
import 'package:to_your_door/const/colors.dart';
import 'package:to_your_door/screen/widget/searchadress_bar.dart';
import 'package:to_your_door/utils/helper.dart';



class ChangeAddressScreen extends StatelessWidget {
  static const routeName = "/changeAddressScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,color: Colors.red,
                        ),
                      ),
                      Text(
                        "Change Address",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: Helper.getScreenHeight(context) * 0.6,
                        child: Image.asset(
                          "assets/map.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 40,
                        child: Image.asset(
                          "assets/currentloc.png",
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 180,
                        child: Image.asset(
                          "assets/loc.png",
                        ),
                      ),
                      Positioned(
                        top: 170,
                        left: 30,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          width: Helper.getScreenWidth(context) * 0.45,
                          decoration: ShapeDecoration(
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Your Current Location",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "StarLagoon ,Thevara,kadavanthara,Kochi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        right: 205,
                        child: ClipPath(
                          clipper: CustomTriangleClipper(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchBar(title: "Search Address"),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.red.withOpacity(0.2),
                          ),
                          child: Icon(
                            Icons.star_rounded,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Choose a saved place",
                            style: TextStyle(
                              color: AppColor.primary,fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward,color: Colors.red,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}