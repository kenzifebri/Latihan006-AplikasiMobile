import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 10),
            const ProfileInfo(
              nama: 'Kenzie Febri',
              role: 'Mahasiswa',
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Edit Profil'),
            ),
            const SizedBox(height: 15),
            const ProfileStats(),
          ],
        ),
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
      child: Icon(Icons.person),
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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
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
        StatItem(angka: '12', label: 'Proyek'),
        StatItem(angka: '128', label: 'Followers'),
        StatItem(angka: '56', label: 'Following'),
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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }
}