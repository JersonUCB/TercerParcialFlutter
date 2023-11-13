import 'package:flutter/foundation.dart';
import 'package:flutter_tercer_parcial/api_service.dart';
import 'package:flutter_tercer_parcial/movie.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _items = [];
  Map<String, int> _cartItems = {};

  List<Movie> get items {
    return [..._items];
  }

  Map<String, int> get cartItems {
    return {..._cartItems};
  }

  Future<List<Movie>> fetchMovies() async {
    final response = await APIService().getMovies();
    _items = response;
    notifyListeners();
    return _items;
  }

  void incrementTicket(String movieId) {
    if (_cartItems.containsKey(movieId)) {
      _cartItems.update(movieId, (existingValue) => existingValue + 1);
    } else {
      _cartItems.putIfAbsent(movieId, () => 1);
    }
    notifyListeners();
  }

  void decrementTicket(String movieId) {
    if (!_cartItems.containsKey(movieId)) {
      return;
    }
    if (_cartItems[movieId]! > 1) {
      _cartItems.update(movieId, (existingValue) => existingValue - 1);
    } else {
      _cartItems.remove(movieId);
    }
    notifyListeners();
  }

  int getTicketCount(String movieId) {
    if (!_cartItems.containsKey(movieId)) {
      return 0;
    }
    return _cartItems[movieId]!;
  }
}