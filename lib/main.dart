import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BIODATA'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.withOpacity(0.3), // Background ungu pudar
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: constraints.maxWidth <
                      2000 // Layout responsif untuk ponsel
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ..._buildBiodata(),
                          const SizedBox(height: 20),
                          ..._buildInfoCards(),
                        ],
                      ),
                    )
                  : Row(
                      children: [
                        const Expanded(child: SizedBox()), // Space for larger screen
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ..._buildBiodata(),
                              const SizedBox(height: 20),
                              ..._buildInfoCards(),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()), // Space for larger screen
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildBiodata() {
    return [
      const Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage:
              AssetImage('assets/profile.jpg'), // Ganti dengan URL gambar Anda
        ),
      ),
      const SizedBox(height: 20),
      Card(
        elevation: 4,
        child: Container(
          width: 2000,
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama: Prasetyo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Nim: 42230007',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Alamat: Dalung Permai, Blok D no 8, BR Lingga Bumi ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Prodi: Teknologi Informasi ',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildInfoCards() {
    return [
      _buildInfoCard('ABOUT',
          'Halo semua perkenalkan nama aku Pras, aku kecil dan besar di Bali saat ini aku kuliah di salah satu kampus terbaik yang ada di bali yaitu "Universitas Pendidikan Nasional" disana aku mengambil jurusan Teknologi Informasi karna menurut ku prospek kerjanya yang sangat baik dan idaman bagi anak-anak muda jaman sekarang. Cita-Citaku ingin menjadi seorang Web Developer oleh karna itu aku gemar sekali mempelajari bahasa pemograman baik itu CSS,HTML,JAVA SCRIP dll sekian deskripsi singkat tentang diri saya terimakasih'),
      const SizedBox(height: 10),
      _buildInfoCard('KONTAK',
          'Email: Prasetyojuli07@gmail.com\nTelepon: +62 81338495950'),
      const SizedBox(height: 10),
      _buildInfoCard('KEMAMPUAN',
          '- Dapat beradaptasi dengan baik\n- Bahasa Inggris\n- Percaya diri'),
    ];
  }

  Widget _buildInfoCard(String title, String content) {
    return Card(
      elevation: 4,
      child: Container(
        width: 2000,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(content),
          ],
        ),
      ),
    );
  }
}
