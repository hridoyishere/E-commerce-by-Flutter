import 'package:flutter/material.dart';
import 'search_screen.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> _categories = [
    {'icon': Icons.devices, 'label': 'Electronics'},
    {'icon': Icons.checkroom, 'label': 'Fashion'},
    {'icon': Icons.watch, 'label': 'Watches'},
    {'icon': Icons.chair, 'label': 'Furniture'},
    {'icon': Icons.sports_basketball, 'label': 'Sports'},
  ];

  static final List<Product> _demoProducts = [
    Product(
      id: '1',
      name: 'Wireless Headphones',
      category: 'Electronics',
      price: 89.99,
      rating: 4.7,
      reviews: 128,
      imageUrl: 'https://picsum.photos/seed/headphone/400/400',
    ),
    Product(
      id: '2',
      name: 'Smart Watch Pro',
      category: 'Watches',
      price: 149.99,
      rating: 4.5,
      reviews: 210,
      imageUrl: 'https://picsum.photos/seed/watch/400/400',
    ),
    Product(
      id: '3',
      name: 'Running Shoes',
      category: 'Sports',
      price: 79.99,
      rating: 4.8,
      reviews: 95,
      imageUrl: 'https://picsum.photos/seed/shoes/400/400',
    ),
    Product(
      id: '4',
      name: 'Leather Backpack',
      category: 'Fashion',
      price: 49.99,
      rating: 4.3,
      reviews: 64,
      imageUrl: 'https://picsum.photos/seed/backpack/400/400',
    ),
    Product(
      id: '5',
      name: 'Bluetooth Speaker',
      category: 'Electronics',
      price: 59.99,
      rating: 4.6,
      reviews: 187,
      imageUrl: 'https://picsum.photos/seed/speaker/400/400',
    ),
    Product(
      id: '6',
      name: 'Sunglasses',
      category: 'Fashion',
      price: 39.99,
      rating: 4.4,
      reviews: 72,
      imageUrl: 'https://picsum.photos/seed/glasses/400/400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── TOP: Search button ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: _buildSearchButton(context),
            ),

            // ── BANNER CAROUSEL ──
            const BannerCarousel(),
            const SizedBox(height: 24),

            // ── CATEGORIES ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSectionHeader('Categories', action: 'See all'),
            ),
            const SizedBox(height: 14),
            _buildCategories(),
            const SizedBox(height: 24),

            // ── PRODUCTS ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSectionHeader('Popular Now', action: 'See all'),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildProductGrid(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Search button (not a textfield — taps into SearchScreen)
  Widget _buildSearchButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SearchScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey.shade500, size: 22),
            const SizedBox(width: 12),
            Text(
              'Search products...',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.tune,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {String? action}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (action != null)
          Text(
            action,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF6C63FF),
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return Column(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Icon(
                  cat['icon'] as IconData,
                  color: const Color(0xFF6C63FF),
                  size: 26,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                cat['label'] as String,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _demoProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: _demoProducts[index],
          onTap: () {
            // TODO: navigate to ProductDetailScreen
          },
        );
      },
    );
  }
}