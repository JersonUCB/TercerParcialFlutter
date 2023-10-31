import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tercer_parcial/CubitPeli.dart'; 
import 'package:flutter_tercer_parcial/statePeli.dart';
import 'CubitPeli.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.select((CubitPeli cubit) => cubit.state.cart);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text('Tu carrito de compras está vacío.'),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final movie = cartItems[index];
                      return ListTile(
                        title: Text(movie.title),
                        subtitle: Text('Precio: 30 Bs'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          context.read<CubitPeli>().decrementCartItem();
                        },
                      ),
                      Text(context.watch<CubitPeli>().state.cart.length.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          context.read<CubitPeli>().addToCart(Movie(title: 'Película de prueba'));
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Agregar aquí la lógica para confirmar la cantidad de entradas
                  },
                  child: Text('Confirmar Entradas'),
                ),
              ],
            ),
    );
  }
}
