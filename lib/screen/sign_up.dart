import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_your_door/screen/welcome_page.dart';
import 'package:to_your_door/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading=false;
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Be one of us",
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
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: firstnameController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Firstname",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'field is empty!';
                                      }
                                      return null;
                                    },
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
                                  child: TextFormField(
                                    controller: lastnameController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Lastname",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'field is empty!';
                                      }
                                      return null;
                                    },
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
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'field is empty!';
                                      }
                                      return null;
                                    },
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
                                  child: TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'field is empty!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        loading?Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(backgroundColor: Colors.redAccent,
                              valueColor: AlwaysStoppedAnimation(Colors.black),),
                          ],
                        ):
                           Row(
                              children: [Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width / 2.4,
                            child: ElevatedButton(
                              onPressed: (){Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomePage()));},
                              child: Text(
                                "Cancel",
                                style:
                                TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: Colors.red, width: 2),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 20.0),
                                  primary: Colors.white,
                                  shape: StadiumBorder(),),),
                             ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 2.4,
                              child: ElevatedButton(
                                onPressed: () {
                                  final String firstname =
                                      firstnameController.text.trim();
                                  final String lastname =
                                      lastnameController.text.trim();
                                  final String email = emailController.text.trim();
                                  final String password =
                                      passwordController.text.trim();

                                  if (_formkey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Registration Successfull..')));setState(() {
                                      loading=true;
                                    });
                                  }
                                  if (firstname.isEmpty) {
                                    print("firstname is Empty");
                                  } else {
                                    if (lastname.isEmpty) {
                                      print("lastname is Empty");
                                    } else {
                                      if (email.isEmpty) {
                                        print("Email is Empty");
                                      } else {
                                        if (password.isEmpty) {
                                          print("Password is Empty");
                                        } else {
                                          context
                                              .read<AuthService>()
                                              .signUp(
                                                firstname,
                                                lastname,
                                                email,
                                                password,
                                              )
                                              .then((value) async {
                                            User? user =
                                                FirebaseAuth.instance.currentUser;

                                            await FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(user?.uid)
                                                .set({
                                              'uid': user?.uid,
                                              'firstname': firstname,
                                              'lastname': lastname,
                                              'email': email,
                                              'password': password,
                                            });setState(() {
                                              loading=false;
                                            });
                                          });
                                        }
                                      }
                                    }
                                  }
                                },
                                child: Text(
                                  "Sign Up",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: Colors.red, width: 2),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 20.0),
                                  primary: Colors.red,
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ),
                      ]  ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
