import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);


  List<Recipe> recipes = [
    Recipe('recipe number1','assets/iu.jpeg'),
    Recipe('recipe number2','assets/iu.jpeg'),
    Recipe('recipe number3','assets/iu.jpeg'),
    Recipe('recipe number4','assets/iu.jpeg'),
    Recipe('recipe number5','assets/iu.jpeg'),
    Recipe('recipe number6','assets/iu.jpeg'),
    Recipe('recipe number7','assets/iu.jpeg'),
    Recipe('recipe number8','assets/iu.jpeg'),
    Recipe('recipe number9','assets/iu.jpeg'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title:const Text('This is the Recepies App')
      ),
      body:ListView.builder(
          itemBuilder:(context,index){
            return GestureDetector(onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder:(context){
                return Text('Detail Page');
              }));
            } ,child:buildRecipeCard(recipes[index]));
      },itemCount:recipes.length)
    );
  }

  Widget buildRecipeCard(Recipe recipe){
    return Card(
      elevation:2.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(recipe.imageUrl!),
            const SizedBox(height:12),
            Text(
                recipe.label!,
                style:const TextStyle(
                  fontSize:20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily:'Palatino',
            ))
          ],
        ),
      ),
    );
  }
}
