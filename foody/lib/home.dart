import 'package:flutter/material.dart';
import 'package:foody/models/models.dart';
import 'package:foody/screens/explore_screen.dart';
import 'package:foody/screens/grocery_screen.dart';
import 'package:foody/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Foody', style: Theme.of(context).textTheme.titleLarge),
        ),
        body: IndexedStack(
          index: tabManager.selectedTab,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      );
    });
  }
}
