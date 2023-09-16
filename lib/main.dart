import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingListScreen(),
    );
  }
}

class ShoppingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shopping List"),
        centerTitle: true,
        actions: [
          Icon(Icons.shopping_cart), // Cart icon
          SizedBox(width: 16.0),
        ],
      ),
      body: ShoppingList(),
    );
  }
}

class ShoppingList extends StatelessWidget {
  final List<ShoppingItem> items = [
    ShoppingItem(icon: Icons.fastfood, name: "Bread"),
    ShoppingItem(icon: Icons.local_grocery_store, name: "Milk"),
    ShoppingItem(icon: Icons.shopping_bag, name: "Eggs"),
    ShoppingItem(icon: Icons.restaurant, name: "Chicken"),
    ShoppingItem(icon: Icons.shopping_cart, name: "Apples"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(items[index].icon),
          title: Text(items[index].name),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("List Tile pressed"),
                duration: Duration(seconds: 2), // Adjust the duration as needed
              ),
            );
          },
        );
      },
    );
  }
}

class ShoppingItem {
  final IconData icon;
  final String name;

  ShoppingItem({required this.icon, required this.name});
}
