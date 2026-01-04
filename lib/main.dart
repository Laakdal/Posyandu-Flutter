import 'package:flutter/material.dart';
import 'dart:ui';
import 'balita.dart';
import 'lansia.dart';
import 'ibu_hamil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Posyandu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 75),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D2D2D),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '👋',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aplikasi pengelolaan data posyandu',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 75),
            // Grid cards with background container
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5E6FF).withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.95,
                  children: [
                    _buildCategoryCard(
                      context,
                      title: 'Balita',
                      bgColor: const Color(0xFFE8D5FF),
                      icon: Icons.child_care_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BalitaPage(),
                          ),
                        );
                      },
                    ),
                    _buildCategoryCard(
                      context,
                      title: 'Ibu Hamil',
                      bgColor: const Color(0xFFFFD6EA),
                      icon: Icons.pregnant_woman_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IbuHamilPage(),
                          ),
                        );
                      },
                    ),
                    _buildCategoryCard(
                      context,
                      title: 'Lansia',
                      bgColor: const Color(0xFFFFE5D9),
                      icon: Icons.elderly_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LansiaPage(),
                          ),
                        );
                      },
                    ),                    
                  ],
                ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String title,
    required Color bgColor,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF2D2D2D),
                    size: 24,
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
