import 'dart:async';
import 'package:flutter/material.dart';

class BannerItem {
  final String imageUrl;
  final String title;
  final String subtitle;

  BannerItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.92);
  int _currentPage = 0;
  Timer? _timer;

  // Demo banners (using picsum for placeholder images)
  final List<BannerItem> _banners = [
    BannerItem(
      imageUrl: 'https://picsum.photos/seed/sale1/800/400',
      title: 'Summer Sale',
      subtitle: 'Up to 50% off',
    ),
    BannerItem(
      imageUrl: 'https://picsum.photos/seed/sale2/800/400',
      title: 'New Arrivals',
      subtitle: 'Fresh drops this week',
    ),
    BannerItem(
      imageUrl: 'https://picsum.photos/seed/sale3/800/400',
      title: 'Free Shipping',
      subtitle: 'On orders over \$50',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted) return;
      final nextPage = (_currentPage + 1) % _banners.length;
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: _controller,
            itemCount: _banners.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final banner = _banners[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Banner image
                      Image.network(
                        banner.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        },
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.image_not_supported),
                        ),
                      ),
                      // Dark gradient overlay for text readability
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(0.55),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      // Text
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              banner.subtitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_banners.length, (i) {
            final active = i == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: active ? 22 : 6,
              decoration: BoxDecoration(
                color: active
                    ? const Color(0xFF6C63FF)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}