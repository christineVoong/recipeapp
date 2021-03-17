import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Functions/DataController.dart';
import 'package:recipeapp/Screens/recipe_screen.dart';

class SearchOptionsScreen extends StatefulWidget {
/*  final DocumentSnapshot passedValue;
  RecipeScreen({this.passedValue});*/
  static String id = 'search_options_screen';

  @override
  _SearchOptionsScreenState createState() => _SearchOptionsScreenState();
}

class _SearchOptionsScreenState extends State<SearchOptionsScreen> {
  final selectedOption = Get.arguments;
  final firestore = FirebaseFirestore.instance;
  List restriction = ["Vegan", "Vegetarian"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        title: Text(selectedOption),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(height: 150,
            child: GetBuilder<DataController>(
                init: DataController(),
                builder: (value) {
                  return FutureBuilder(
                    //initialData: [],
                      future: value.getRestriction('RecipeInfo', selectedOption),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Get.to(RecipeScreen(),
                                      transition: Transition.downToUp,
                                      arguments: snapshot.data[index],
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Container(width: 150,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(snapshot.data[index].data()['image'])
                                                )),
                                          ),),),
                                      Padding(padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                            constraints: BoxConstraints(maxWidth: 100),
                                            child: Text(snapshot.data[index].data()['name'])),),
                                    ],),
                                );},
                            ),
                          );}
                      });
                }),
          ),
        ),
      )
    );
  }


}
