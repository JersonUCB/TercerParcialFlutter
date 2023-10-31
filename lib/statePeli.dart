

class StatePeli {
  List<Movie> movies;
  List<Movie> cart;

  StatePeli({this.movies = const [], this.cart = const []});

  StatePeli copyWith({required List<Movie> movies, required List<Movie> cart}) {
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
