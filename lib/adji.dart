import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E1A47), Color(0xFF111315)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // ===== TITLE =====
                const Text(
                  "Your profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 24),

                // ===== AVATAR (FOTO) =====
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.purpleAccent, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    backgroundColor: Colors.black,
                  ),
                ),

                const SizedBox(height: 12),

                // ===== EDIT PHOTO BUTTON =====
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Edit photo",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 24),

                // ===== SECTION =====
                _item(
                  title: "Name",
                  subtitle: "gion ardhana",
                  trailing: "Edit",
                ),

                _divider(),

                _item(
                  title: "Email address",
                  subtitle: "ardhanagion@gmail.com",
                  trailing: "Edit",
                ),

                _divider(),

                _dropdownItem(
                  title: "What will you be using Canva for?",
                  value: "Student",
                  items: const ["Student", "Teacher", "Designer"],
                ),

                _divider(),

                _dropdownItem(
                  title: "Language",
                  value: "English (US)",
                  items: const ["English (US)", "Indonesia"],
                ),

                const SizedBox(height: 20),

                // ===== CONNECTED ACCOUNT =====
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Connected social accounts",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1F22),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.g_mobiledata, color: Colors.black),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Google",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "gion ardhana",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "Disconnect",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===== ITEM TEXT =====
  static Widget _item({
    required String title,
    required String subtitle,
    required String trailing,
  }) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.grey)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.white)),
      trailing: OutlinedButton(
        onPressed: () {},
        child: Text(trailing, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  // ===== DROPDOWN ITEM =====
  static Widget _dropdownItem({
    required String title,
    required String value,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          DropdownButtonFormField(
            value: value,
            dropdownColor: const Color(0xFF1C1F22),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF1C1F22),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  static Widget _divider() {
    return const Divider(color: Colors.grey, thickness: 0.3, height: 1);
  }
}
