// To parse this JSON data, do
//
//     final recipesmodelapi = recipesmodelapiFromJson(jsonString);

import 'dart:convert';

Recipesmodelapi recipesmodelapiFromJson(String str) => Recipesmodelapi.fromJson(json.decode(str));



class Recipesmodelapi {
    List<Recipe> recipes;

    Recipesmodelapi({
        required this.recipes,
    });

    factory Recipesmodelapi.fromJson(Map<String, dynamic> json) => Recipesmodelapi(
        recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
    );

   
}

class Recipe {

    String name;
    List<String> ingredients;
    List<String> instructions;
  
    int cookTimeMinutes;
    int servings;

    String cuisine;
   

   
    String image;
 


    Recipe({
    
        required this.name,
        required this.ingredients,
        required this.instructions,
     
        required this.cookTimeMinutes,
        required this.servings,
     
        required this.cuisine,
 
        required this.image,

   
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
  
        name: json["name"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
  
        cookTimeMinutes: json["cookTimeMinutes"],
        servings: json["servings"],

        cuisine: json["cuisine"],
           image: json["image"],
       
    );

    Map<String, dynamic> toJson() => {
      
        "name": name,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
  
        "cookTimeMinutes": cookTimeMinutes,
        "servings": servings,
     
        "cuisine": cuisine,
      
     
    
        "image": image,
      
      
    };
}