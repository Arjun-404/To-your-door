import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_your_door/models/cart_model.dart';
import 'package:to_your_door/models/categoies_model.dart';
import 'package:to_your_door/models/food_categories_model.dart';
import 'package:to_your_door/models/food_model.dart';


class MyProvider extends ChangeNotifier {
  List<CategoriesModel> burgerList = [];
  CategoriesModel? burgerModel;

  Future<void> getBurgerCategory() async {
    List<CategoriesModel> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('8GA0hAHp1Swek8u4biOP')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModel = CategoriesModel(
        image: element['image'],
        name: element['name'],
      );
      newBurgerList.add(burgerModel!);
      burgerList = newBurgerList;
    });
    notifyListeners();
  }

  get throwBurgerList {
    return burgerList;
  }


  //////2nd category///////
  List<CategoriesModel> recipeList = [];
  CategoriesModel? recipeModel;

  Future<void> getRecipeCategory() async {
    List<CategoriesModel> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('8GA0hAHp1Swek8u4biOP')
        .collection('Recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeModel = CategoriesModel(
        image: element['image'],
        name: element['name'],
      );
      newRecipeList.add(recipeModel!);
      recipeList = newRecipeList;
    });
    notifyListeners();
  }

  get throwRecipeList {
    return recipeList;
  }


  /////3r category//////////
  List<CategoriesModel> pizzaList = [];
  CategoriesModel? pizzaModel;

  Future<void> getPizzaCategory() async {
    List<CategoriesModel> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('8GA0hAHp1Swek8u4biOP')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaModel = CategoriesModel(
        image: element['image'],
        name: element['name'],
      );
      newPizzaList.add(pizzaModel!);
      pizzaList = newPizzaList;
    });
    notifyListeners();
  }

  get throwPizzaList {
    return pizzaList;
  }


  //////4th category////
  List<CategoriesModel> drinkList = [];
  CategoriesModel? drinkModel;

  Future<void> getDrinkCategory() async {
    List<CategoriesModel> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('8GA0hAHp1Swek8u4biOP')
        .collection('Drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkModel = CategoriesModel(
        image: element['image'],
        name: element['name'],
      );
      newDrinkList.add(drinkModel!);
      drinkList = newDrinkList;
    });
    notifyListeners();
  }

  get throwDrinkList {
    return drinkList;
  }

  //////////Single Food Item ///////
  List<FoodModel> foodModelList = [];
  FoodModel? foodModel;

  Future<void> getFoodList() async {
    List<FoodModel> newSingleFoodList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'foods').get();
    querySnapshot.docs.forEach((element) {
      foodModel = FoodModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        rating :element['rating'],
      );
      newSingleFoodList.add(foodModel!);
    },
    );

    foodModelList = newSingleFoodList;
    notifyListeners();
  }

  get throwFoodModelList {
    return foodModelList;
  }


  ////////////burger category/////////////
  List<FoodCategoriesModel> burgerCategoriesList = [];
  FoodCategoriesModel? burgerCategoriesModel;

  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModel> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'foodcategories').doc('O6zM1NAwGuh4yNqsSYwE')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModel = FoodCategoriesModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        rating :element['rating'],
      );
      newBurgerCategoriesList.add(burgerCategoriesModel!);
      burgerCategoriesList = newBurgerCategoriesList;
    });
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

  /////////////Recipe category////////////

  List<FoodCategoriesModel> recipeCategoriesList = [];
  FoodCategoriesModel? recipeCategoriesModel;

  Future<void> getRecipeCategoriesList() async {
    List<FoodCategoriesModel> newRecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'foodcategories').doc('O6zM1NAwGuh4yNqsSYwE')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModel = FoodCategoriesModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        rating :element['rating'],
      );
      newRecipeCategoriesList.add(recipeCategoriesModel!);
      recipeCategoriesList = newRecipeCategoriesList;
    });
  }

  get throwRecipeCategoriesList {
    return recipeCategoriesList;
  }


  ////////////pizza category////////////////////

  List<FoodCategoriesModel> pizzaCategoriesList = [];
  FoodCategoriesModel? pizzaCategoriesModel;

  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModel> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'foodcategories').doc('O6zM1NAwGuh4yNqsSYwE').collection('pizza').get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModel = FoodCategoriesModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        rating :element['rating'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModel!);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  ////////////////////Drinks category/////////

  List<FoodCategoriesModel> drinkCategoriesList = [];
  FoodCategoriesModel? drinkCategoriesModel;

  Future<void> getDrinkCategoriesList() async {
    List<FoodCategoriesModel> newDrinkCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'foodcategories').doc('O6zM1NAwGuh4yNqsSYwE').collection('Drink').get();
    querySnapshot.docs.forEach((element) {
      drinkCategoriesModel = FoodCategoriesModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        rating :element['rating'],
      );
      newDrinkCategoriesList.add(drinkCategoriesModel!);
      drinkCategoriesList = newDrinkCategoriesList;
    });
  }

  get throwDrinkCategoriesList {
    return drinkCategoriesList;
  }


  //////////////add to car////////

  List<CartModel> cartList = [];
  List<CartModel> newCartList = [];


  CartModel? cartModel;
  void addtoCart(
      {required String name,
        required String image,
        required int price,
        required int quantity})
  {
    cartModel=CartModel(
        image: image,
        name: name,
        price: price,
        quantity: quantity,
    );
    newCartList.add(cartModel!);
    cartList=newCartList;
  }
  get throwCartList{
    return cartList;
  }
  int? deleteIndex;
  void getDeleteIndex(int index){
    deleteIndex=index;
  }
  void delete(){
    cartList.removeAt(deleteIndex!);
    notifyListeners();
  }


}

