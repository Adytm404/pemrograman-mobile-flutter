import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:slicing_ui_praktikum/app/modules/home/models/movie_model.dart';

class HomeController extends GetxController {
  final movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final data = await _fetchMoviesFromAPI();
      movies.assignAll(data);
    } catch (e) {
    }
  }

  Future<List<Movie>> _fetchMoviesFromAPI() async {
    final response = await http.get(Uri.parse('https://nyanhosting.id/api/movies/app.json'));

    if (response.statusCode == 200) {
      final jsonString = response.body;
      final jsonData = json.decode(jsonString);
      List<Movie> movies = [];

      for (var key in jsonData.keys) {
        final movieData = jsonData[key];
        movies.add(
          Movie(
            title: movieData['Film'],
            year: movieData['Tahun'],
            thumbnail: movieData['Thumbnail'],
          ),
        );
      }

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
