import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riccardo_roux_cocktail_app/models/cocktails.dart';

class DrinkDetailScreen extends StatelessWidget {
  final dynamic cocktail;
  final bool isFavorite;

  DrinkDetailScreen({required this.cocktail, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text(cocktail['strDrink']),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? Colors.black : null,),
            onPressed: () {
              final cocktails = Provider.of<CocktailModel>(context, listen: false);
              cocktails.toggleFavorite(cocktail);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  cocktail['strDrinkThumb'],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text('Ingredienti:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8.0),
              if (cocktail['strIngredient1'] != null)
                Text('• ${cocktail['strIngredient1']}',
                    style: TextStyle(fontSize: 18)),
              if (cocktail['strIngredient2'] != null)
                Text('• ${cocktail['strIngredient2']}',
                    style: TextStyle(fontSize: 18)),
              if (cocktail['strIngredient3'] != null)
                Text('• ${cocktail['strIngredient3']}',
                    style: TextStyle(fontSize: 18)),
              if (cocktail['strIngredient4'] != null)
                Text('• ${cocktail['strIngredient4']}',
                    style: TextStyle(fontSize: 18)),
              if (cocktail['strIngredient5'] != null)
                Text('• ${cocktail['strIngredient5']}',
                    style: TextStyle(fontSize: 18)),
              SizedBox(height: 16.0),
              Text(
                'Preparazione:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                cocktail['strInstructionsIT'],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height:16.0),
              Text(
                'Preparation:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                cocktail['strInstructions'],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
