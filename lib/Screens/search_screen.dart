import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/Screens/search_options_screen.dart';
import 'recipe_screen.dart';
import '../Functions/DataController.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final firestore = FirebaseFirestore.instance;
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isSearched = false;
  List<String> suggestions = ["Quick", "Vegan", "Vegetarian", "Starters", "Main", "Dessert"];
  List<String> searchCultures = ["Chinese", "Mexican", "Italian", "French", "Thai", "Japanses", "Indian", "Other"];

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Get.to(
                    RecipeScreen(),
                    transition: Transition.downToUp,
                    arguments: snapshotData.docs[index],
                  );
                },
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(snapshotData.docs[index].data()['image']),
                ),
                title: Text(snapshotData.docs[index].data()['name']),
                subtitle: Text(snapshotData.docs[index].data()['creator']),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        actions: <Widget>[
          GetBuilder<DataController>(
              init: DataController(),
              builder: (value) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          isSearched = false;
                        });
                      }),
                );
              }),
          GetBuilder<DataController>(
              init: DataController(),
              builder: (value) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        value.queryData(searchController.text).then((value) {
                          snapshotData = value;
                          setState(() {
                            isSearched = true;
                          });
                        });
                      }),
                );
              }),
        ],
        title: TextField(
          decoration: InputDecoration(hintText: 'Search'),
          controller: searchController,
        ),
      ),
      body: isSearched
          ? searchedData()
          : SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Search...",
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
                  SizedBox(height: 8),
                  GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 4,
                    children: suggestions.map(
                          (suggestion) =>
                              GestureDetector(
                                onTap: (){
                                  Get.to(SearchOptionsScreen(),
                                    transition: Transition.downToUp,
                                    arguments: suggestion,
                                  );
                                },
                                child: Card(
                                  color: Colors.deepOrangeAccent[100],
                                    child: Center(child: Text(suggestion))),
                              ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 8),
                  Text("Explore Cultures...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25),),
                  SizedBox(height: 8),
                  GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 4,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 4,
                    children: searchCultures.map(
                          (culture) =>
                          GestureDetector(
                            onTap: (){
                              Get.to(SearchOptionsScreen(),
                                transition: Transition.downToUp,
                                arguments: culture,
                              );
                            },
                            child: Card(
                                color: Colors.deepOrangeAccent[100],
                                child: Center(child: Text(culture))),
                          ),
                    )
                        .toList(),
                  )
                ],
              )),
    );
  }
}
