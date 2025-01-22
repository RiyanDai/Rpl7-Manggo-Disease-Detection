import 'package:flutter/material.dart';

class WaveBackground extends StatelessWidget {
  final Widget child;
  const WaveBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFB4F5B4),
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
} 