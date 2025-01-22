import 'package:flutter/material.dart';
import 'package:my_tflit_app/main.dart';
import 'package:my_tflit_app/screen/home/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 7));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB4F5B4), // Light green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
  'assets/images/plant_logo.png', // Sesuaikan dengan path yang benar
  width: 100,
  height: 100,
  color: const Color(0xFF2E7D32),
),
            const SizedBox(height: 24),
            // Text with shadow effect
            Text(
              'Manggo Disease\nDetection',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Serif',
                color: const Color(0xFF2E7D32),
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.black.withOpacity(0.3),
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