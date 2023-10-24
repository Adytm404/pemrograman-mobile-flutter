import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slicing_ui_praktikum/app/modules/home/views/bottom_nav.dart';
import 'package:slicing_ui_praktikum/app/modules/home/views/player_view.dart';
import '../controllers/home_controller.dart';
import 'package:http/http.dart' as http;


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);


  // Future<List<Map<String, dynamic>>> _loadMovies() async {
  //   final jsonString = await rootBundle.loadString('lib/app/data/movies.json');
  //   final jsonData = json.decode(jsonString);
  //   List<Map<String, dynamic>> movies = [];

  //   for (var key in jsonData.keys) {
  //     movies.add(jsonData[key]);
  //   }

  //   return movies;
  // }

    Future<List<Map<String, dynamic>>> _loadMovies() async {
      final response = await http.get(Uri.parse('https://nyanhosting.id/api/movies/app.json'));

      if (response.statusCode == 200) {
        final jsonString = response.body;
        final jsonData = json.decode(jsonString);
        List<Map<String, dynamic>> movies = [];

        for (var key in jsonData.keys) {
          movies.add(jsonData[key]);
        }

        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Nav Menu
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 47,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 47,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFFD9D9D9),
                          ),
                          child: Center(
                            child: Image.network(
                              'https://siswahosting.com/files/mobile/magnifying-glass.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Menu 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Now",
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF9A9A9A),
                        ),
                      ),
                    ],
                  ),

                  FutureBuilder<List<Map<String, dynamic>>>(

                    future: _loadMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No data available');
                      } else {
                        final movies = snapshot.data;
                        return Column(
                          children: movies!.map((movie) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayerView(key: key),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 222,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xFFD9D9D9),
                                              image: DecorationImage(
                                                image: NetworkImage(movie['Thumbnail']),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.all(8),
                                                  color: Colors.black.withOpacity(0.7),
                                                  child: Text(
                                                    "${movie['Film']} (${movie['Tahun']})",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppNav(),
    );
  }
}
