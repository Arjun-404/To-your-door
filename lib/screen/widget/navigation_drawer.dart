
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_your_door/provider/navigation_provider.dart';
import 'package:to_your_door/screen/about_page.dart';
import 'package:to_your_door/screen/cart_page.dart';
import 'package:to_your_door/screen/order_page.dart';
import 'package:to_your_door/screen/profile_page.dart';
import 'package:to_your_door/screen/welcome_page.dart';
import 'package:to_your_door/screen/widget/drawer_items.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding =EdgeInsets.symmetric(horizontal: 20);


  @override
  Widget build(BuildContext context) {
    final safeArea=
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);


    final provider=Provider.of<NavigationProvider>(context);
    final isCollapsed =provider.isCollapsed;





    return Container(
        width:isCollapsed ? MediaQuery.of(context).size.width* 0.2:null,
        child: Drawer(
          child: Container(
            color: Colors.red.shade500,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                color: Colors.white,
                child:buildHeader(isCollapsed),
                ),
                SizedBox(height: 24,),
                buildList(items:itemsFirst,isCollapsed:isCollapsed),
                SizedBox(height: 24),
                Divider(color:Colors.white70),
                SizedBox(height: 24),
                buildList(indexOffset:itemsFirst.length,items:itemsSecond,isCollapsed:isCollapsed),
                Spacer(),
                buildCollapseIcon(context,isCollapsed),
                SizedBox(height: 12,),
              ],
            ),
          ),
        ));
  }

 Widget buildHeader(bool isCollapsed)=>isCollapsed
  ?  Image.asset(
   'assets/rlogo.png',
   height:100,
   width: 100,
 )
 : Row(
   children: [
     SizedBox(width: 10,height: 30,),
     Image.asset(
       'assets/rlogo.png',
       height:100,
       width: 100,
     ),
     SizedBox(width: 1,),
   Text("To!your door",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25,color: Colors.black),
   ),
   ],
 );

 Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
   final double size = 52;
   final icon=isCollapsed ?Icons.arrow_forward_ios: Icons.arrow_back_ios;
   final alignment=isCollapsed? Alignment.center :Alignment.centerRight;
   final margin=EdgeInsets.only(right: 16);
   final width= isCollapsed ?double.infinity:size;

   return Container(
     alignment: alignment,
     margin: margin,
     child: Material(
       color: Colors.transparent,
       child: InkWell(
         child: Container(
          width:width,
           height: size,
           child:Icon(icon,color: Colors.white,),
         ),
         onTap: (){
           final provider=
               Provider.of<NavigationProvider>(context,listen:false);
           provider.toggleIsCollapsed();
         },
       ),
     ),
   );
 }

 Widget buildList({
   required items,
   required bool isCollapsed,
   int indexOffset=0,
 }) =>
     ListView.separated(
       padding: isCollapsed ?EdgeInsets.zero: padding,
       shrinkWrap: true,
         primary: false,
       itemCount: items.length,
       separatorBuilder:(context,index)=>SizedBox(height:16),
       itemBuilder: (context,index){
         final item=items[index];

         return buildMenuItem(
           isCollapsed:isCollapsed,
           text:item.title,
           icon:item.icon,
           onClicked: ()=> selectItem(context,indexOffset+index),
         );
       },
     );

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked}) {
    final color=Colors.white,
        leading=Icon(icon,color:color);

    return Material(
      color: Colors.transparent,
      child:isCollapsed?
      ListTile(
        title: leading,
        onTap: onClicked,
      ): ListTile(
        leading: leading,
        title: Text(text,style: TextStyle(color: color,fontSize: 16),),
        onTap: onClicked,
      ),
    );
  }

  void selectItem(BuildContext context, int index) {
    final navigateTO = (page) => Navigator.of(context).push(MaterialPageRoute(
      builder:(context)=>page,
    ));

    Navigator.of(context).pop();
    switch (index){
      case 0:
      navigateTO(ProfilePage());
      break;
      case 1:
        navigateTO(CartPage());
        break;
      case 2:
        navigateTO(OrderPage());
        break;
      case 3:
        navigateTO((AboutPage()));
        break;
      case 4:
        navigateTO(FirebaseAuth.instance.signOut().then((value)
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WelcomePage()));
        }));
        break;

  }
}
  }
