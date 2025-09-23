import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;
  final String userName;

  const CategoryPage({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/RITOSTORE.png"),
          fit: BoxFit.cover,
          opacity: 0.98,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black.withValues(alpha: 0.35),
          elevation: 0,
          title: Text(
            categoryName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              // RITO STORE Title
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "RITO STORE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 3,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black54,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Category Icon and Name
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(categoryIcon, size: 80, color: Colors.white),
                    const SizedBox(height: 15),
                    Text(
                      categoryName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Welcome to the $categoryName section, $userName!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Category Description
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About $categoryName',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _getCategoryDescription(categoryName),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Sample Products Grid
                        const Text(
                          'Featured Products',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3,
                          children: _getProductList(categoryName),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getCategoryDescription(String category) {
    switch (category.toLowerCase()) {
      case 'monitors':
        return 'Discover our premium collection of monitors featuring high-resolution displays, gaming monitors, ultrawide screens, and professional displays. Perfect for work, gaming, or entertainment.';
      case 'printers':
        return 'Browse our range of printers including laser printers, inkjet printers, 3D printers, and all-in-one solutions. From home office to professional printing needs.';
      case 'keyboards':
        return 'Explore mechanical keyboards, wireless keyboards, gaming keyboards, and ergonomic designs. Find the perfect typing experience for your needs.';
      case 'mouse':
        return 'Find the perfect mouse from our collection of gaming mice, wireless mice, ergonomic mice, and precision pointing devices for every use case.';
      case 'webcams':
        return 'High-quality webcams for video conferencing, streaming, content creation, and security monitoring. Crystal clear video for all your needs.';
      case 'headphones':
        return 'Premium headphones including noise-canceling, wireless, gaming, and studio headphones. Experience superior audio quality and comfort.';
      case 'speakers':
        return 'Powerful speakers ranging from desktop speakers to professional audio systems. Enhance your audio experience with premium sound quality.';
      case 'controllers':
        return 'Gaming controllers for all platforms including wireless controllers, pro controllers, and specialty gaming accessories for the ultimate gaming experience.';
      default:
        return 'Explore our premium selection of $category products designed to meet your needs with quality and reliability.';
    }
  }

  List<Widget> _getProductList(String category) {
    List<String> products;

    switch (category.toLowerCase()) {
      case 'monitors':
        products = [
          '4K Gaming Monitor',
          'Ultrawide Display',
          'Professional Monitor',
          'Budget Monitor',
        ];
        break;
      case 'printers':
        products = [
          'Laser Printer',
          'Inkjet Printer',
          '3D Printer',
          'All-in-One',
        ];
        break;
      case 'keyboards':
        products = [
          'Mechanical Keyboard',
          'Wireless Keyboard',
          'Gaming Keyboard',
          'Ergonomic Keyboard',
        ];
        break;
      case 'mouse':
        products = [
          'Gaming Mouse',
          'Wireless Mouse',
          'Ergonomic Mouse',
          'Precision Mouse',
        ];
        break;
      case 'webcams':
        products = [
          'HD Webcam',
          '4K Webcam',
          'Streaming Webcam',
          'Security Camera',
        ];
        break;
      case 'headphones':
        products = [
          'Noise-Canceling',
          'Wireless Headphones',
          'Gaming Headset',
          'Studio Headphones',
        ];
        break;
      case 'speakers':
        products = [
          'Desktop Speakers',
          'Bluetooth Speaker',
          'Professional Audio',
          'Sound System',
        ];
        break;
      case 'controllers':
        products = [
          'Wireless Controller',
          'Pro Controller',
          'Racing Wheel',
          'Flight Stick',
        ];
        break;
      default:
        products = ['Product 1', 'Product 2', 'Product 3', 'Product 4'];
    }

    return products
        .map(
          (product) => Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            ),
            child: Center(
              child: Text(
                product,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
