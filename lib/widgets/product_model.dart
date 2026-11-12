class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final double rating;
  final int reviews;
  final String description;
  final List<String> images;
  final List<String> highlights;
  final Map<String, String> specs;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.images,
    required this.highlights,
    required this.specs,
  });

  String get thumbnail => images.isNotEmpty ? images.first : '';
}

// Central demo catalog — used by home + detail + suggested products
final List<Product> demoProducts = [
  Product(
    id: '1',
    name: 'Wireless Headphones',
    category: 'Electronics',
    price: 89.99,
    oldPrice: 129.99,
    rating: 4.7,
    reviews: 128,
    description:
        'Experience immersive sound with our premium wireless headphones. '
        'Featuring active noise cancellation, 40-hour battery life, and '
        'ultra-comfortable memory foam ear cushions — perfect for travel, '
        'work, and everything in between.',
    images: [
      'https://picsum.photos/seed/headphone1/800/800',
      'https://picsum.photos/seed/headphone2/800/800',
      'https://picsum.photos/seed/headphone3/800/800',
      'https://picsum.photos/seed/headphone4/800/800',
    ],
    highlights: [
      'Active Noise Cancellation',
      '40-hour battery life',
      'Bluetooth 5.3',
      'Memory foam ear cushions',
    ],
    specs: {
      'Brand': 'SoundPro',
      'Color': 'Midnight Black',
      'Weight': '250g',
      'Warranty': '1 year',
    },
  ),
  Product(
    id: '2',
    name: 'Smart Watch Pro',
    category: 'Watches',
    price: 149.99,
    oldPrice: 199.99,
    rating: 4.5,
    reviews: 210,
    description:
        'Stay connected and track your health with the Smart Watch Pro. '
        'Features a stunning AMOLED display, heart-rate monitoring, GPS, '
        'and a battery that lasts up to 7 days on a single charge.',
    images: [
      'https://picsum.photos/seed/watch1/800/800',
      'https://picsum.photos/seed/watch2/800/800',
      'https://picsum.photos/seed/watch3/800/800',
    ],
    highlights: [
      'AMOLED display',
      'Heart-rate & SpO2 monitoring',
      'Built-in GPS',
      '7-day battery',
    ],
    specs: {
      'Brand': 'TechFit',
      'Color': 'Silver',
      'Size': '44mm',
      'Warranty': '2 years',
    },
  ),
  Product(
    id: '3',
    name: 'Running Shoes',
    category: 'Sports',
    price: 79.99,
    rating: 4.8,
    reviews: 95,
    description:
        'Lightweight and breathable running shoes designed for maximum '
        'comfort and performance. Perfect for daily runs or long-distance '
        'training with responsive cushioning.',
    images: [
      'https://picsum.photos/seed/shoe1/800/800',
      'https://picsum.photos/seed/shoe2/800/800',
      'https://picsum.photos/seed/shoe3/800/800',
    ],
    highlights: [
      'Breathable mesh upper',
      'Responsive cushioning',
      'Durable rubber outsole',
      'Reflective details',
    ],
    specs: {
      'Brand': 'AeroRun',
      'Color': 'Blue / White',
      'Weight': '280g',
      'Warranty': '6 months',
    },
  ),
  Product(
    id: '4',
    name: 'Leather Backpack',
    category: 'Fashion',
    price: 49.99,
    rating: 4.3,
    reviews: 64,
    description:
        'A sleek, versatile backpack crafted from premium leather. '
        'Fits a 15-inch laptop, has multiple compartments, and is built '
        'to last — ideal for work, school, or weekend trips.',
    images: [
      'https://picsum.photos/seed/bag1/800/800',
      'https://picsum.photos/seed/bag2/800/800',
      'https://picsum.photos/seed/bag3/800/800',
    ],
    highlights: [
      'Fits 15" laptops',
      'Premium leather',
      'Multiple compartments',
      'Water-resistant',
    ],
    specs: {
      'Brand': 'UrbanCraft',
      'Color': 'Tan Brown',
      'Capacity': '20L',
      'Warranty': '1 year',
    },
  ),
  Product(
    id: '5',
    name: 'Bluetooth Speaker',
    category: 'Electronics',
    price: 59.99,
    rating: 4.6,
    reviews: 187,
    description:
        'Portable Bluetooth speaker with rich, room-filling sound. '
        'IPX7 waterproof rating, 20-hour battery life, and a built-in mic '
        'for calls. Take your music anywhere.',
    images: [
      'https://picsum.photos/seed/speaker1/800/800',
      'https://picsum.photos/seed/speaker2/800/800',
      'https://picsum.photos/seed/speaker3/800/800',
    ],
    highlights: [
      'IPX7 waterproof',
      '20-hour battery',
      'Bluetooth 5.0',
      'Built-in microphone',
    ],
    specs: {
      'Brand': 'BassBox',
      'Color': 'Charcoal',
      'Weight': '540g',
      'Warranty': '1 year',
    },
  ),
  Product(
    id: '6',
    name: 'Sunglasses',
    category: 'Fashion',
    price: 39.99,
    rating: 4.4,
    reviews: 72,
    description:
        'Classic polarized sunglasses with UV400 protection. '
        'Stylish frame, scratch-resistant lenses, and lightweight design '
        'for all-day comfort.',
    images: [
      'https://picsum.photos/seed/glasses1/800/800',
      'https://picsum.photos/seed/glasses2/800/800',
      'https://picsum.photos/seed/glasses3/800/800',
    ],
    highlights: [
      'UV400 protection',
      'Polarized lenses',
      'Scratch-resistant',
      'Lightweight frame',
    ],
    specs: {
      'Brand': 'SunShade',
      'Color': 'Black',
      'Lens': 'Polarized',
      'Warranty': '6 months',
    },
  ),
];