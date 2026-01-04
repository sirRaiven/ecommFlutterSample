import 'package:flutter/material.dart';
import 'homepage.dart'; // where Product model exists

class Cart extends StatefulWidget {
  final List<Product> cartItems;

  const Cart({super.key, required this.cartItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Cart")),
      body: widget.cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty."))
          : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final product = widget.cartItems[index];
                return ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text(product.name),
                  subtitle: Text("₱${product.price.toStringAsFixed(0)}"),
                  trailing: IconButton(
                    onPressed: () {
                      // Remove item from cart
                      setState(() {
                        widget.cartItems.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete_outline),
                  ),
                );
              },
            ),
    );
  }
}
