
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_your_door/screen/home_page.dart';
import 'package:to_your_door/screen/intro_Screen.dart';
import 'package:to_your_door/screen/sign_up.dart';





class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
final _auth = FirebaseAuth.instance;



class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;
  bool showSpinner = false;
  bool loading=false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.red.shade900,
        Colors.red.shade800,
        Colors.red.shade300,
        ]),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(
    height: 100,
    ),
    Padding(
    padding: EdgeInsets.all(20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Log In",
    style: TextStyle(color: Colors.white, fontSize: 35),
    ),
    SizedBox(
    height: 5,
    ),
    Text(
    "Welcome Back",
    style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    ]),
    ),
    SizedBox(
    height: 20,
    ),
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(60),
    topRight: Radius.circular(60)),
    ),
    child: Padding(
    padding: EdgeInsets.all(20),
    child: SingleChildScrollView(
    child: Column(
    children: [
    SizedBox(
    height: 80,
    ),
    Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
    BoxShadow(
    color: Colors.grey,
    blurRadius: 20,
    offset: Offset(0, 10),
    ),
    ]),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    }, validator: (value) {
                  if (value!.isEmpty) {
                    return 'field is empty!';
                  }
                  return null;
                },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
              ),

            ),

      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Colors.grey.shade300),
            ),
        ),
                    ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                      //Do something with the user input.
                    }, validator: (value) {
                  if (value!.isEmpty) {
                    return 'field is empty!';
                  }
                  return null;
                },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                ),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Colors.grey.shade300),
            ),
        ),),
                SizedBox(
                  height: 24.0,
                ),
    ],
    ),
          ),
    ),
      SizedBox(
        height: 38,
      ),
     loading? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(backgroundColor: Colors.redAccent,
            valueColor: AlwaysStoppedAnimation(Colors.black),),
        ],
      ):
         Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 1.2,
              child:  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Login Successfull..')));setState(() {
                      loading=true;  });
                      }
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IntroScreen()));
                        }
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        showSpinner = false;
                      });setState(() {
                        loading=false;
                      });
                    },
                  child: Text(
                  "Login",
                  style:
                  TextStyle(color: Colors.white, fontSize: 15),
                ),
            style: ElevatedButton.styleFrom(
              side: BorderSide(color: Colors.red, width: 2),
              padding: EdgeInsets.symmetric(
                  horizontal: 40.0, vertical: 20.0),
              primary: Colors.red,
              shape: StadiumBorder(),
            ),),

            ),
      SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.grey),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUp()));
              },
              child: Text(
                "Register now",
                style: TextStyle(color: Colors.red),
              )),
          SizedBox(
            height:20,
          ),
        ],
      ),
     ],

    ),
    ),
    ),

   ),

    ),],
    ),
        ),
    );
  }
}