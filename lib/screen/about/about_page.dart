import 'package:flutter/material.dart';
import '../../widgets/wave_background.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WaveBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tentang Aplikasi', style: TextStyle(fontSize: 41, color: Colors.white),),
              // Image
              const SizedBox(height: 20),
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Kelompok7.png'), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Card with text
              Card(
                color: Colors.green[100]?.withOpacity(0.8),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text(
                        'Ini adalah aplikasi untuk deteksi penyakit pada daun mangga. '
                            'Aplikasi ini memanfaatkan teknologi machine learning untuk '
                            'menganalisis gambar daun dan memberikan diagnosis penyakit yang '
                            'mungkin. Dengan aplikasi ini, petani dapat dengan cepat '
                            'mengidentifikasi masalah pada tanaman mereka dan mengambil tindakan '
                            'yang tepat untuk meningkatkan hasil panen.\n\n'
                            'Dirancang oleh Kelompok 7 mata kuliah Rekayasa Perangkat Lunak:\n'
                            '- Programmer: Riyan\n'
                            '- Desain: Izmi\n'
                            '- Scrum Master: Jaya\n'
                            '- Dokumentasi: Matius',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
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