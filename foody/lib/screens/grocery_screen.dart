import 'package:flutter/material.dart';
import 'package:foody/models/models.dart';
import 'package:foody/screens/empty_grocery_screen.dart';
import 'package:foody/screens/grocery_item_screen.dart';
import 'package:foody/screens/grocery_list_screen.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(onCreate: (item) {
                manager.addItem(item);
                Navigator.pop(context);
              }, onUpdate: (item) {
                //
              }),
            ),
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          return GroceryListScreen(manager: manager);
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
