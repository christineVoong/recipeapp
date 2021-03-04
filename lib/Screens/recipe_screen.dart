import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/DataController.dart';


/*class RecipeScreen extends StatelessWidget{
  RecipeScreen({this.passedValue});
  final passedValue;
  final _firestore = FirebaseFirestore.instance;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        title: const Text('Recipe'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("RecipeInfo").where(FieldPath.documentId, isEqualTo: passedValue).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),);
          }
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(document.data()['name']),
                subtitle: new Text(document.data()['description']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}*/

class RecipeScreen extends StatefulWidget {
/*  final DocumentSnapshot passedValue;
  RecipeScreen({this.passedValue});*/
  static String id = 'recipe_screen';

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {

  //final _firestore = FirebaseFirestore.instance;

  /*void recipeStream() async{
    await for (var snapshot in _firestore.collection('Recipeinfo').snapshots()){
      for (var recipe in snapshot.docs){
        print(recipe.data);
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final selectedRecipe = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent[200],
        title: Text(selectedRecipe.data()["name"])
      ),
    ) ;


      /*Container(
        child: Card(
          child: ListTile(
            title: Text(widget.passedValue.data()["name"]),
            //subtitle: Text(widget.passedValue.data()["content"]),
          ),
        )
      );*/
  }
}
