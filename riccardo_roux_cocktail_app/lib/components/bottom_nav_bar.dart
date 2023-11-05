import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.black,
          color: Colors.black26,
          tabActiveBorder: Border.all(color: Colors.black),
          gap: 8,
          tabs: const [
            //Cerca
            GButton(
              icon: Icons.search,
              text: 'Cerca',
            ),

            //Preferiti
            GButton(
              icon: Icons.star_border,
              text: 'Preferiti',
            ),



          ]),
    );
  }
}