import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CubitPeli extends Cubit<StatePeli> {
  CubitPeli() : super(StatePeli());

  void fetchMovies() async {
    final apiUrl = Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3',
    );

    http.Response response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((item) => Movie.fromJson(item)).toList();
      emit(state.copyWith(movies: movies, cart: []));
    }
  }

  void decrementCartItem() {
    if (state.cart.isNotEmpty) {
      List<Movie> cart = List.from(sta

  void decrementCartItem() {}te.cart)..removeLast();
      emit(state.copyWith(cart: cart));
    }
  }

  void addToCart(Movie movie) {
    List<Movie> cart = List.from(state.cart)..add(movie);
    emit(state.copyWith(cart: cart, movies: []));
  }
}

class StatePeli {
  List<Movie> movies;
  List<Movie> cart;

  StatePeli({this.movies = const [], this.cart = const []});

  StatePeli copyWith({List<Movie>? movies, List<Movie>? cart}) {
    return StatePeli(
      movies: movies ?? this.movies,
      cart: cart ?? this.cart,
    );
  }
}

class Movie {
  final String title;

  Movie({required this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
    );
  }
}
