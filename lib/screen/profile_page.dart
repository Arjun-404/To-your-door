import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_your_door/models/user_model.dart';
import 'package:to_your_door/screen/home_page.dart';
import 'package:to_your_door/screen/widget/profile_button.dart';

 late UserModel userModel=UserModel(firstname: 'firstname', email: 'email');


class ProfilePage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(ProfilePage.pattern.toString());

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String myEmail;
  late String myFirstname;
  bool isEdit = false;

  TextEditingController firstname =
  TextEditingController(text: userModel.firstname);
  TextEditingController email=
  TextEditingController(text: userModel.email);

  Widget textFromField({required String hintText}) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: ListTile(
        leading: Text(hintText),
      ),
    );
  }

  void profileValidation(
      {required TextEditingController? email,
        required TextEditingController? firstname,
        required BuildContext context}) async {
    if (firstname!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("fullName is empty"),
        ),
      );
      return;
    } else if (email!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email address is empty"),
        ),
      );
      return;
    } else if (!widget.regExp.hasMatch(email.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email address"),
        ),
      );
      return;
    } else {
      buildUpdateProfile();
    }
  }

  Widget nonEditTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png"),
              radius: 70,
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: FutureBuilder(
              future: _fetch(),
              builder: (context, snapShot) {
                if (snapShot.connectionState != ConnectionState
                    .done)
                  return Text("Loading");
                return textFromField(hintText: "Firstname :   $myFirstname");
              }
          ),
        ),
        SizedBox(
          height: 30,
        ),
        FutureBuilder(
            future: _fetch(),
            builder: (context, snapShot) {
              if (snapShot.connectionState != ConnectionState.done)
                return Text("Loading");
              return textFromField(
                  hintText: "Email         :    $myEmail");
            }
        ),
      ],
    );
  }

  Widget editTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png",),
              radius: 70,
            ),
          ],
        ),
        TextFormField(
          controller: firstname,
          decoration: InputDecoration(hintText: userModel.firstname),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: email,
          decoration: InputDecoration(
            hintText: userModel.email,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        MyButton(
          onPressed: () {
            profileValidation(
              context: context,
              email: email,
              firstname: firstname,
            );
          },
          text: "Update",
        )
      ],
    );
  }

  Future buildUpdateProfile() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        "firstname": firstname.text,
        "email": email.text,
      },
    ).then(
          (value) =>  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage()))
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile!",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: isEdit
            ? IconButton(
          onPressed: () {
            setState(() {
              isEdit = false;
            });
          },
          icon: Icon(Icons.close,color: Colors.red,),
        )
            : IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = true;
              });
            },
            icon: Icon(Icons.edit,color: Colors.red,),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: isEdit ? editTextField() : nonEditTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myEmail = ds.data()!['email'];
        print(myEmail);
        myFirstname = ds.data()!['firstname'];
        print(myFirstname);
      }).catchError((e) {
        print(e);
      });
  }
  fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myFirstname = ds.data()!['firstname'];
        print(myFirstname);
      }).catchError((e) {
        print(e);
      });
  }
}