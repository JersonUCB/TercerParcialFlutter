import 'package:flutter/material.dart';
import 'package:flutter_tercer_parcial/confirmationScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tercer_parcial/movie.dart';
import 'package:flutter_tercer_parcial/movie_provider.dart';


class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Ticket App'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: Provider.of<MovieProvider>(context, listen: false).fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.error != null) {
              return Center(child: Text('An error occurred!'));
            } else {
              return Consumer<MovieProvider>(
                builder: (ctx, movieData, child) => ListView.builder(
                  itemCount: movieData.items.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: Image.network('https://image.tmdb.org/t/p/w500${movieData.items[i].posterPath}'),
                    title: Text(movieData.items[i].title),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            movieData.decrementTicket(movieData.items[i].id);
                          },
                        ),
                        Text('${movieData.getTicketCount(movieData.items[i].id)}'), // This should display the current ticket count
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            movieData.incrementTicket(movieData.items[i].id);
                          },
                        ),
                        ElevatedButton(
                          child: Text('Confirm'),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => ConfirmationScreen(movieData.items[i], movieData.getTicketCount(movieData.items[i].id)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}