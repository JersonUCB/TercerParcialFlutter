import 'package:flutter/material.dart';
import 'package:flutter_tercer_parcial/movie.dart';


class ConfirmationScreen extends StatelessWidget {
  final Movie movie;
  final int ticketCount;

  ConfirmationScreen(this.movie, this.ticketCount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              height: 200, // you can change the size to fit your needs
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Movie: ${movie.title}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Number of tickets: $ticketCount',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Total price: ${ticketCount * 30} Bs',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}