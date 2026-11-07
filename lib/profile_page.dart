import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = 'Kenzie Febri';

  final List<String> pengalaman = const [
    'Junior Flutter Developer - Freelance Project',
    'Mobile Developer Intern - Startup Solusi Digital',
    'Frontend Mobile Developer - Proyek Aplikasi Kampus',
    'UI Designer & Mobile Enthusiast - Inovasi App',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          const ProfileAvatar(),
          const SizedBox(height: 10),
          ProfileInfo(
            nama: userName,
            role: 'Mobile Developer & Mahasiswa',
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Edit Profil'),
          ),
          const SizedBox(height: 15),
          const ProfileStats(),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pengalaman Kerja',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: pengalaman.length,
              itemBuilder: (context, index) {
                return ExperienceCard(
                  title: pengalaman[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      child: Icon(Icons.person, size: 40),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String nama;
  final String role;

  const ProfileInfo({
    super.key,
    required this.nama,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nama,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 2),
        Text(role),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatItem(angka: '15', label: 'Proyek'),
        StatItem(angka: '1.2K', label: 'Followers'),
        StatItem(angka: '42', label: 'Following'),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String angka;
  final String label;

  const StatItem({
    super.key,
    required this.angka,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          angka,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(label),
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;

  const ExperienceCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.blue),
        title: Text(title),
      ),
    );
  }
}