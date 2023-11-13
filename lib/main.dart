import 'package:flutter/material.dart';
import 'package:flutter_tercer_parcial/movie_provider.dart';
import 'package:provider/provider.dart';
import 'movie_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MovieProvider(),
      child: MaterialApp(
        title: 'Movie Ticket App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MovieListScreen(),
      ),
    );
  }
}