import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riccardo_roux_cocktail_app/models/cocktails.dart';
import 'package:riccardo_roux_cocktail_app/screens/cocktail_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cocktailModel = Provider.of<CocktailModel>(context);
    final favorites = cocktailModel.favorites;

    return Container(
      padding: EdgeInsets.all(16.0),
      child: favorites.isEmpty
          ? Center(
        child: Text('Nessun preferito. Aggiungi un cocktail tra i preferiti.'),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final cocktail = favorites[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                cocktail['strDrinkThumb'],
                width: 80,
                height: 80,
              ),
              title: Text(cocktail['strDrink']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrinkDetailScreen(
                      cocktail: cocktail,
                      isFavorite: cocktailModel.isFavorite(cocktail),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
