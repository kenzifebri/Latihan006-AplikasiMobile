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
    'Mobile Developer Intern - PT Inovasi Solusi',
    'Lead Frontend Mobile - Aplikasi Kampus',
    'UI/UX & Flutter Enthusiast - Pengembangan Sistem',
  ];

  void _showEditDialog() {
    final TextEditingController controller = TextEditingController(text: userName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profil'),
          content: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = controller.text;
                });
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const ProfileAvatar(),
          const SizedBox(height: 10),
          ProfileInfo(
            nama: userName,
            role: 'Mobile Developer & Mahasiswa',
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _showEditDialog,
            icon: const Icon(Icons.edit, size: 16),
            label: const Text('Edit Profil'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade50,
              foregroundColor: Colors.blue,
              elevation: 0,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ProfileStats(),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
          const SizedBox(height: 8),
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
      radius: 45,
      backgroundColor: Colors.grey,
      child: Icon(
        Icons.person,
        size: 55,
        color: Colors.white,
      ),
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
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          role,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
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
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue.shade50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}