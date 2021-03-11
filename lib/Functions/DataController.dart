import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getRandom(String collection) async{
    var lengthOfCollection = await firestore.collection("RecipeInfo").snapshots().length;
    //does not include the number in the max parameter
    Random random = new Random();
    int randomNumber = random.nextInt(lengthOfCollection+1);
    QuerySnapshot snapshot = await firestore.collection(collection).where("id", isEqualTo: randomNumber).get();
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

}