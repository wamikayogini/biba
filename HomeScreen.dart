import 'package:flutter/material.dart';


class Homescreen extends StatelessWidget {
  final List<Map<String, String>> products = List.generate(6, (index) {
    return {
      "image": (index % 2 == 0)
          ? "assets/images/black_suit.png"
          : "assets/images/white_suit.png", 
      "title": "Carbon Black Liva Straight Printed Suit Set",
      "price": "\$180",
    };
  });

  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            
            child: Row(
              children: [
                const Text(
                  "New",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 30),
                _categoryButton("Suit Set"),
                _categoryButton("Kurta & Tops"),
                _categoryButton("Dresses"),
                _categoryButton("Bottoms"),
              ],
            
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter & List View Buttons
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _filterButton("NEW IN BIBAINDIA"),
                const SizedBox(width: 8),
                _filterButton("SORT & FILTER"),
                const SizedBox(width: 8),
                _filterButton("VIEW IN LIST VIEW"),
              ],
            ),
          ),
          ),

          // Product List
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _productCard(product);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Top Navigation Categories
  Widget _categoryButton(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }

  // Widget for Sort & Filter Buttons
  Widget _filterButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Product Card Widget
  Widget _productCard(Map<String, String> product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                product["image"]!,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Suit Set",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product["title"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product["price"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.open_in_new, size: 28),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}