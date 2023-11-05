import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riccardo_roux_cocktail_app/models/cocktails.dart';
import 'package:riccardo_roux_cocktail_app/screens/home_screen.dart';
import 'package:riccardo_roux_cocktail_app/screens/favorites_screen.dart';
import 'package:riccardo_roux_cocktail_app/components/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CocktailModel(),
      child: MaterialApp(
        title: 'Cocktail App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex){
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  final List<Widget> _screens = [
    SearchScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        body: _screens[_selectedIndex],
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
      ),
    );
  }
}
