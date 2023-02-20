import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_your_door/models/categoies_model.dart';
import 'package:to_your_door/models/food_categories_model.dart';
import 'package:to_your_door/models/food_model.dart';
import 'package:to_your_door/provider/my_provider.dart';
import 'package:to_your_door/screen/cart_page.dart';
import 'package:to_your_door/screen/categories.dart';
import 'package:to_your_door/screen/detail_page.dart';
import 'package:to_your_door/screen/profile_page.dart';
import 'package:to_your_door/screen/trackorder_page.dart';
import 'package:to_your_door/screen/video_screen.dart';
import 'package:to_your_door/screen/widget/bottom_container.dart';
import 'package:to_your_door/screen/widget/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  int currentTab=0;
  final List<Widget> screens=[
    HomePage(),
    Drawer(),
    ProfilePage(),
    TrackOrder(),

  ];
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=HomePage();
  //1st
  List<CategoriesModel> burgerList = [];

  //2nd
  List<CategoriesModel> recipeList = [];

  //3rd
  List<CategoriesModel> pizzaList = [];

  //4th
  List<CategoriesModel> drinkList = [];

  List<FoodModel> singleFoodList = [];

  List<FoodCategoriesModel> burgerCategoriesList = [];
  List<FoodCategoriesModel> recipeCategoriesList = [];
  List<FoodCategoriesModel> pizzaCategoriesList = [];
  List<FoodCategoriesModel> drinkCategoriesList = [];

  Widget categoriesContainer(
      {required Function() onTap,
      required String image,
      required String name}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget drawerItem(
      {required String name, required Icon icon, required Function() onTap}) {
    return ListTile(
      leading: IconButton(
        icon: icon,
        color: Colors.black,
        onPressed: onTap,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }

  //1st
  Widget burger() {
    return Row(
      children: burgerList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: burgerCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  //2nd
  Widget recipe() {
    return Row(
      children: recipeList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: recipeCategoriesList,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  //3rd
  Widget pizza() {
    return Row(
      children: pizzaList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: pizzaCategoriesList,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  //4th
  Widget drink() {
    return Row(
      children: drinkList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: drinkCategoriesList,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    //1st
    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;
    //2nd
    provider.getRecipeCategory();
    recipeList = provider.throwRecipeList;
    //3rd
    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;
    //4th
    provider.getDrinkCategory();
    drinkList = provider.throwDrinkList;

    //single food list/////
    provider.getFoodList();
    singleFoodList = provider.throwFoodModelList;

    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;

    provider.getRecipeCategoriesList();
    recipeCategoriesList = provider.throwRecipeCategoriesList;

    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.throwPizzaCategoriesList;

    provider.getDrinkCategoriesList();
    drinkCategoriesList = provider.throwDrinkCategoriesList;

    return Scaffold(
      drawer:NavigationDrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "  ",
          style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body:  ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                children: [
                  Text(
                    "Delivering to",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: "current location",
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Your! Door",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      value: "current location",
                    ),
                  ],
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:IconButton( onPressed: () {},

                              icon: Icon(Icons.search),
                            ),
                            hintText:"Search food and more...",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                            ),
                            contentPadding: EdgeInsets.only(top: 10)),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListTile(
                    leading: Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      drink(),
                      recipe(),
                      burger(),
                      pizza(),

                      // categoriesContainer(image: 'assets/1.png', name: 'All'),
                      // categoriesContainer(image: 'assets/2.png', name: 'Burger'),
                      // categoriesContainer(image: 'assets/3.png', name: 'Recipe'),
                      // categoriesContainer(image: 'assets/8.png', name: 'Pizza'),
                      // categoriesContainer(image: 'assets/5.png', name: 'Drink'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListTile(
                    leading: Text(
                      "Products to explore",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Categories(list: pizzaCategoriesList)));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Column(
                    children: singleFoodList
                        .map((e) => BottomContainer(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      image: e.image,
                                      name: e.name,
                                      price: e.price,
                                      rating:e.rating,
                                    ),
                                  ),
                                );
                              },
                              image: e.image,
                              price: e.price,
                              name: e.name,
                              rating:e.rating,
                            ))
                        .toList()
                    // children: [

                    //   bottomContainer(
                    //       image: 'assets/2.png', price: 12, name: 'Burger1'),
                    //   bottomContainer(
                    //       image: 'assets/2.png', price: 12, name: 'Burger1'),
                    //   bottomContainer(
                    //       image: 'assets/2.png', price: 12, name: 'Burger1'),
                    //   bottomContainer(
                    //       image: 'assets/2.png', price: 12, name: 'Burger1'),
                    //   bottomContainer(
                    //       image: 'assets/2.png', price: 12, name: 'Burger1'),
                    //   bottomContainer(
                    //       image: 'assets/2.png', price: 12, name: 'Burger1'),
                    // ],
                    ),
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/logofloat.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text("  Good Food \n Fast Delivery",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,color:Colors.grey.shade500,fontStyle: FontStyle.italic),),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]

          ),


       floatingActionButton: FloatingActionButton(
         child:Image.asset("assets/logofloat.png",),
         onPressed: (){
           Navigator.pushReplacement(context,
               MaterialPageRoute(builder:
                   (context) =>
                   VideoScreen(),
               ),
           );
         },
         backgroundColor: Colors.white,
       ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: PageStorage(
         bucket: bucket,
         child: BottomAppBar(
           shape: CircularNotchedRectangle(),
           notchMargin: 20,
           child: Container(
             height: 60,
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     MaterialButton(
                         minWidth: 40,
                         onPressed:(){
                           setState(() {
                             currentScreen=HomePage();
                             currentTab=0;
                           });
                           },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.home,
                           color: currentTab==0 ? Colors.red :Colors.grey,
                         ),
                         Text("Home",style:TextStyle(color: currentTab==0?Colors.red:Colors.grey),),
                       ],
                     ),
                     ),
                     MaterialButton(
                       minWidth: 40,
                       onPressed:(){
                         setState(() {
                           currentScreen=Drawer();
                           currentTab=1;
                         });
                       },
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(
                             Icons.dashboard,
                             color: currentTab==1 ? Colors.red :Colors.grey,
                           ),
                           Text("Drawer",style:TextStyle(color: currentTab==1?Colors.red:Colors.grey),),
                         ],
                       ),
                     ),
                   ],
                 ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   MaterialButton(
                     minWidth: 40,
                     onPressed:(){
                       setState(() {
                         currentScreen=ProfilePage();
                         currentTab=2;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.person,
                           color: currentTab==2 ? Colors.red :Colors.grey,
                         ),
                         Text("Profile",style:TextStyle(color: currentTab==2?Colors.red:Colors.grey),),
                       ],
                     ),
                   ),
                   MaterialButton(
                     minWidth: 40,
                     onPressed:(){
                       setState(() {
                         currentScreen=TrackOrder();
                         currentTab=3;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.room_outlined,
                           color: currentTab==3 ? Colors.red :Colors.grey,
                         ),
                         Text("Tracker",style:TextStyle(color: currentTab==3?Colors.red:Colors.grey),),
                       ],
                     ),
                   ),
               ],
             )
         ]  ),
         ]),
    ),
         ),
       ),
     );
  }
}
