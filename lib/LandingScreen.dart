import 'package:flutter/material.dart';
import 'package:final_project/main.dart';

class LandingScreen extends StatelessWidget {
  final String userName;
  const LandingScreen({super.key, required this.userName});

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
            'Welcome, $userName',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              tooltip: 'Logout',
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                // Since there's no Firebase Auth, just navigate back to the landing (main background) screen
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const BackgroundScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Browse Items",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.black45,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: const [
                      _ShopItem(title: "Monitors", icon: Icons.tv),
                      _ShopItem(title: "Printers", icon: Icons.print),
                      _ShopItem(title: "Keyboards", icon: Icons.keyboard),
                      _ShopItem(title: "Mouse", icon: Icons.mouse),
                      _ShopItem(title: "Webcams", icon: Icons.videocam),
                      _ShopItem(title: "Headphones", icon: Icons.headphones),
                      _ShopItem(title: "Speakers", icon: Icons.speaker),
                      _ShopItem(
                        title: "Controllers",
                        icon: Icons.sports_esports,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShopItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const _ShopItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Opening $title...')));
          // TODO: Navigate to detail pages for each category if needed.
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
