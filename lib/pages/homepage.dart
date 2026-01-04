import 'package:flutter/material.dart';
import 'package:practices101/pages/cart.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0; // UI state only

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${product.name} added to cart"),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  final List<Product> cartItems = [];

  final List<Product> products = [
    Product(name: "Wireless Headphones", price: 1299),
    Product(name: "Smart Watch", price: 2499),
    Product(name: "Gaming Mouse", price: 899),
    Product(name: "Bluetooth Speaker", price: 1599),
    Product(name: "Power Bank", price: 999),
    Product(name: "USB-C Cable", price: 299),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search products",
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Banner
            SizedBox(height: 160, child: bannerItem("Big Sale 50% OFF")),

            /// 🔹 Categories
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryItem(Icons.phone_android, "Electronics"),
                  categoryItem(Icons.checkroom, "Fashion"),
                  categoryItem(Icons.fastfood, "Food"),
                  categoryItem(Icons.home, "Home"),
                  categoryItem(Icons.sports_esports, "Games"),
                ],
              ),
            ),

            /// 🔹 Products
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Recommended for You",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return productCard(products[index]);
              },
            ),
          ],
        ),
      ),

      /// 🔹 Bottom Navigation Bar (UI Only)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }

  /// 🔹 Banner Widget
  Widget bannerItem(String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// 🔹 Category Widget
  Widget categoryItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orange.shade100,
            child: Icon(icon, size: 30, color: Colors.orange),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  /// 🔹 Product Card Widget
  Widget productCard(Product product) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Product Image Placeholder
          Expanded(
            child: Container(
              color: Colors.grey.shade300,
              child: const Center(child: Icon(Icons.image, size: 50)),
            ),
          ),

          /// Product Name
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// Price + Add to Cart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₱${product.price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    addToCart(product);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
