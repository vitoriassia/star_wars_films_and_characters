import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TabNavigation extends StatelessWidget {
  final int _selectedIndex;
  final Function(int) onTabChange;
  TabNavigation(this._selectedIndex, this.onTabChange);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.movie,
                  text: 'Filmes',
                ),
                GButton(
                  icon: Icons.groups,
                  text: 'Personagens',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favoritos',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: onTabChange),
        ),
      ),
    );
  }
}
// Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 20,
//         title: const Text('GoogleNavBar'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: