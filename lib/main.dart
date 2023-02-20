import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_your_door/provider/my_provider.dart';
import 'package:to_your_door/provider/navigation_provider.dart';
import 'package:to_your_door/screen/home_page.dart';
import 'package:to_your_door/screen/login_page.dart';
import 'package:provider/provider.dart';
import 'package:to_your_door/screen/splash_screen.dart';
import 'package:to_your_door/screen/welcome_page.dart';
import 'package:to_your_door/services/auth_services.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(Myapp());
}

class Myapp extends StatefulWidget{

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  var auth=FirebaseAuth.instance;
  var isLogin=false;

  checkifLogin() async{
    auth.authStateChanges().listen((User? user){
      if(user!=null&& mounted){
        setState(() {
          isLogin=true;
        });
      }
    });
  }

  @override
  void initState() {
    checkifLogin();
    super.initState();
  }



  @override
  Widget build(BuildContext context)=>ChangeNotifierProvider(
      create:(context)=>NavigationProvider(),
   child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MyProvider()),
          Provider<AuthService>(
            create: (_) => AuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges, initialData: null,
          ),
        ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter Demo',
      theme: ThemeData(),
      home: isLogin ? HomePage():MyHomePage(),
    ),
   ),
   );
}


class AuthWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    if(user != null){
      return WelcomePage();
    }
    return HomePage();
  }

}