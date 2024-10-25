import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futurebuilder_recipes/Data_model.dart';
import 'package:http/http.dart'as http;
class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
late Future<Recipesmodelapi?> futureData;
  @override
  void initState(){
    super.initState();
   futureData = getData();
  }
 Future<Recipesmodelapi?> getData() async{
    try {
      String url="https://dummyjson.com/recipes";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode ==200){
        return Recipesmodelapi.fromJson(json.decode(res.body));
  
      } else{
        throw Exception('Failed to load data');
      }
    } catch (e) {
     debugPrint (e.toString());
     return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  const Color.fromARGB(255, 255, 195, 232),
      appBar: AppBar(
        title: Text("Recipes App"),
        backgroundColor: const Color.fromARGB(255, 255, 195, 232),
      ),
      body: FutureBuilder<Recipesmodelapi?>(
        future: futureData,
       builder: (context,snapshot){
        if (snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        } else if (snapshot.hasError){
          return Center(child: Text('Error:${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data !=null){
          final recipes=snapshot.data!.recipes;
        
       return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
     itemCount: recipes.length,
       itemBuilder: (context,index){
        final Recipe =recipes[index];
      
          return Container(
            height: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black,
            width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 253, 214, 241),
                blurRadius: 0,
                spreadRadius: 1,
              )
            ]),
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
           child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    
                Image.network(Recipe.image,width: 100,height: 65,),
            SizedBox(height: 10),
                
                Text(Recipe.name,style: TextStyle(fontSize: 10,color: Colors.black),),
               SizedBox(height: 5),

                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(Recipe.cuisine),
                    SizedBox(width: 5),
      
           
                  ],
                )
              ],
            ),
          );
      },
          );
        } else {
          return Center(child: Text('No Data availablr'),);
        }
        }   
  
  ),
    
      
    );
  }
}