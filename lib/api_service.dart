import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tercer_parcial/movie.dart';

class APIService {
  Future<List<Movie>> getMovies() async {
    final uri = Uri.parse('https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3');
    final response = await http.get(uri);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Movie> loadedMovies = [];
    extractedData['results'].forEach((movieData) {
      loadedMovies.add(Movie.fromJson(movieData));
    });
    return loadedMovies;
  }
}