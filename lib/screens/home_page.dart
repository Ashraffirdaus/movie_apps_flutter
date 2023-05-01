import 'package:flutter/material.dart';
import 'package:movie_apps/models/movie_search.dart';
import 'package:movie_apps/screens/details_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var movieEditingController = TextEditingController();
 var movieList = [
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Column(
        children: [
          Row(
            children: [
               Expanded(
                flex: 4,
                child:  TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter your name",
                    contentPadding: EdgeInsets.symmetric(horizontal:8.0)
                  ),
                  controller: movieEditingController,
                ),
              ),
              Expanded(
                child: ElevatedButton(onPressed: (() {
                  fetchMovies(movieEditingController.text).then((value){
                    setState(() {
                      movieList =value;
                    });
                  });
                }), child: const Text("Search")),
              ),
              
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (((context, index) {
                  return ListTile(
                    leading: Image.network(movieList[index].poster),
                    title: Text(movieList[index].title),
                    subtitle: Text(movieList[index].year),
                    trailing: IconButton(
                      onPressed: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (((context) => DetailsPage(
                                  imdbID: movieList[index].imdbId,
                                ))),
                          ),
                          
                        );
                      }),
                      icon: const Icon(Icons.navigate_next),
                    ),
                  );
                }))),
          ),
        ],
      ),
    );
  }
  Future<List<MovieSearch>> fetchMovies(searchText) async {
  final response = await http
      .get(Uri.parse('https://www.omdbapi.com/?s=$searchText&apikey=87d10179'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MovieSearch.moviesFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movie');
  }
}
}
