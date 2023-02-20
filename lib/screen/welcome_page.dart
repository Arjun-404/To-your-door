import 'package:flutter/material.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_your_door/screen/intro_Screen.dart';
import 'package:to_your_door/screen/login_page.dart';
import 'package:to_your_door/screen/sign_up.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = "/landingScreen";

  @override
  Widget button({
    required String name,
    required Color color,
    required Color textColor,
    required Function() ontap,
  }) {
    return Container(
      height: 55,
      width: 500,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.red, width: 2),
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: color,
          shape: StadiumBorder(),
        ),
        child: Text(
          name,
          style: TextStyle(color: textColor, fontSize: 10),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipShadow(
                clipper: CustomClipperAppBar(),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.placeholder,
                    offset: Offset(0, 15),
                    blurRadius: 10,
                  ),
                ],
                child: Container(
                  width: double.infinity,
                  height: Helper.getScreenHeight(context) * 0.5,
                  decoration: ShapeDecoration(
                    color: AppColor.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    "assets/foods2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/logo1.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: Helper.getScreenHeight(context) * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    SizedBox(width: double.infinity, height: 20),
                    button(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      name: "Log In",
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(width: double.infinity, height: 10),
                    button(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        name: "Sign Up",
                        color: Colors.white,
                        textColor: Colors.red),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipperAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset endPoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset endPoint2 = Offset(size.width * 0.5, size.height * 0.78);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset endPoint3 = Offset(size.width * 0.75, size.height * 0.96);
    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endPoint4 = Offset(size.width * 0.79, size.height);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.21, size.height)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..quadraticBezierTo(
        controlPoint2.dx,
        controlPoint2.dy,
        endPoint2.dx,
        endPoint2.dy,
      )
      ..quadraticBezierTo(
        controlPoint3.dx,
        controlPoint3.dy,
        endPoint3.dx,
        endPoint3.dy,
      )
      ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endPoint4.dx,
        endPoint4.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
