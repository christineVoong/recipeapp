import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<int> randomNum;

/*  void getRandom() async{
    final documents = await firestore.collection('RecipeInfo').snapshots();
    final size = documents.length.toString();
    var random = new Random();
    int randomNumber = random.nextInt(int.parse(size)+1);
    final recipe = firestore.collection('RecipeInfo').where("id", isEqualTo: randomNumber);
    //return recipe;
  }*/

  Future<int> randNumber() async{
    final lengthOfCollection = await firestore.collection('RecipeInfo').snapshots().length;
    //does not include the number in the max parameter
    var random = new Random();
    int randomNumber = random.nextInt(lengthOfCollection+1);
    return randomNumber;
  }

  Future getRandom(String collection) async{
    randomNum = randNumber();
    QuerySnapshot snapshot = await firestore.collection(collection).where("id", isEqualTo: randomNum).get();
    return snapshot.docs;
  }

  Future getBreakfast(String collection) async{
    QuerySnapshot snapshot = await firestore.collection(collection).where("type", isEqualTo: "breakfast").get();
    return snapshot.docs;
  }

  Future getLunch(String collection) async{
    QuerySnapshot snapshot = await firestore.collection(collection).where("type", isEqualTo: "lunch").get();
    return snapshot.docs;
  }

  Future getDinner(String collection) async{
    QuerySnapshot snapshot = await firestore.collection(collection).where("type", isEqualTo: "dinner").get();
    return snapshot.docs;
  }

  Future getRecipe(String collection) async{
    QuerySnapshot snapshot = await firestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async{
    return firestore.collection("RecipeInfo").where('name', isGreaterThanOrEqualTo: queryString).get();
  }

  Future getRestriction(String collection, selectedOption) async{
    if (selectedOption == "Vegan"){
      QuerySnapshot snapshot = await firestore.collection(collection).where("restriction", isEqualTo: "vegan").get();
      return snapshot.docs;
    } else {
      if (selectedOption == "Vegetarian"){
        QuerySnapshot snapshot = await firestore.collection(collection).where("restriction", isEqualTo: "vegetarian").get();
        return snapshot.docs;
      }
    }
  }

}