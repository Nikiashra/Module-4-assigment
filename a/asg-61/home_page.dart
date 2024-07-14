import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_item.dart';
import 'cart_provider.dart';
import 'cart_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    final List<MenuItem> menuItems = [
      MenuItem(
        title: 'Vegetables and Poached Egg',
        price: 13.50,
        imageUrl: 'assets/images/vegetables_and_poached_egg.jpg',
      ),
      MenuItem(
        title: 'Avocado Salad',
        price: 19.28,
        imageUrl: 'assets/images/Tomato-Avocado-Salad-SQ.jpg',
      ),
      MenuItem(
        title: 'Vegetables',
        price: 19.28,
        imageUrl: 'assets/images/vagetables.jpg',
      ),
      MenuItem(
        title: 'Pancake',
        price: 19.28,
        imageUrl: 'assets/images/Oreo-Pancakes.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Menu'),
        actions: [
          DropdownButton<String>(
            items:
                <String>['Pancake', 'Vegetables', 'Salad'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle dropdown change
            },
            hint: Text("Select"),
            dropdownColor: Colors.white,
          ),
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MenuSearch(menuItems),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10.0),
        itemCount: menuItems.length,
        itemBuilder: (ctx, index) {
          return menuItems[index];
        },
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;

  MenuItem({
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      child: GridTile(
        child: Image.asset(imageUrl, fit: BoxFit.cover),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(title, textAlign: TextAlign.center),
          subtitle: Text('\$${price.toStringAsFixed(2)}',
              textAlign: TextAlign.center),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              cart.addItem(CartItem(
                  id: DateTime.now().toString(), title: title, price: price));
            },
          ),
        ),
      ),
    );
  }
}

class MenuSearch extends SearchDelegate<MenuItem> {
  final List<MenuItem> menuItems;

  MenuSearch(this.menuItems);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = menuItems.where(
        (item) => item.title.toLowerCase().contains(query.toLowerCase()));

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10.0),
      itemCount: results.length,
      itemBuilder: (ctx, index) {
        return results.elementAt(index);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = menuItems.where(
        (item) => item.title.toLowerCase().contains(query.toLowerCase()));

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10.0),
      itemCount: suggestions.length,
      itemBuilder: (ctx, index) {
        return suggestions.elementAt(index);
      },
    );
  }
}
