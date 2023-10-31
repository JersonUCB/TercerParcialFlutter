import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tercer_parcial/CubitPeli.dart';
import 'package:flutter_tercer_parcial/cubitPeli.dart';
import 'CubitPeli.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie Tickets',
      home: BlocProvider(
        create: (context) => CubitPeli()..fetchMovies(),
        child: const MyHomePage(title: 'Movie Tickets'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CubitPeli, StatePeli>(
        builder: (context, state) {
          if (state.movies.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text('Precio: 30 Bs'),
                  trailing: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      context.read<CubitPeli>().addToCart(movie);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}