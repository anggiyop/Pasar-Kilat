// lib/presentation/screens/home_page.dart

import 'package:flutter/material.dart';
import 'package:pasar_kilat/core/colors.dart';
import 'package:pasar_kilat/data/models/product_model.dart';
import 'package:pasar_kilat/presentation/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // --- DATA DUMMY (Nantinya akan diambil dari service/API) ---
    final List<String> bannerImages = [
      'assets/images/banner1.jpg',
      'assets/images/banner2.jpg',
    ];

    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.phone_android, 'name': 'Elektronik'},
      {'icon': Icons.checkroom, 'name': 'Fashion'},
      {'icon': Icons.menu_book, 'name': 'Buku'},
      {'icon': Icons.sports_esports, 'name': 'Hobi'},
      {'icon': Icons.kitchen, 'name': 'Dapur'},
    ];

    final List<Product> products = [
      Product(name: 'Smart TV 4K UHD 50 inch', imageUrl: 'assets/images/product1.jpg', price: 5500000),
      Product(name: 'Wireless Headphone Pro', imageUrl: 'assets/images/product2.jpg', price: 1200000),
      Product(name: 'Sepatu Lari Nyaman', imageUrl: 'assets/images/product3.jpg', price: 750000),
      Product(name: 'Blender Serbaguna 2 Liter', imageUrl: 'assets/images/product4.jpg', price: 450000),
    ];
    // --- END OF DATA DUMMY ---

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Pasar Kilat', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari produk di Pasar Kilat...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),

            // Banner Carousel
            SizedBox(
              height: 150,
              child: PageView.builder(
                itemCount: bannerImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(bannerImages[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Categories
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 16.0 : 8.0, right: index == categories.length - 1 ? 16.0 : 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red[50],
                          child: Icon(categories[index]['icon'], color: primaryColor),
                        ),
                        const SizedBox(height: 8),
                        Text(categories[index]['name'], style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Section Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Penawaran Spesial',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
              ),
            ),
            const SizedBox(height: 16),

            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}