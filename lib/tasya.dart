import 'package:flutter/material.dart';

void main() => runApp(const CanvaCloneApp());

class CanvaCloneApp extends StatelessWidget {
  const CanvaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF111111),
      ),
      home: const CanvaHomePage(),
    );
  }
}

class CanvaHomePage extends StatelessWidget {
  const CanvaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E1A47), Color(0xFF111111)],
            stops: [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // ===== HEADER =====
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Avatar + Title
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Avatar akun kiri atas
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.purpleAccent,
                                  width: 1.5,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage(
                                  'assets/images/adji.jpeg',
                                ),
                              ),
                            ),
                          ),

                          // Judul tengah
                          const Text(
                            "What will you learn today?",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Search Bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.purpleAccent.withOpacity(0.5),
                          ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.white70),
                            hintText: 'Search templates',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ===== GRID MENU =====
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 50,
                    childAspectRatio: 1,
                  ),
                  delegate: SliverChildListDelegate([
                    _buildMenuItem(
                      Icons.play_circle_fill,
                      "Magic Video",
                      Colors.grey,
                      isNew: true,
                    ),
                    _buildMenuItem(Icons.favorite, "Social media", Colors.red),
                    _buildMenuItem(
                      Icons.videocam,
                      "Video",
                      Colors.purpleAccent,
                    ),
                    _buildMenuItem(
                      Icons.camera_alt,
                      "Photo editor",
                      Colors.blueGrey,
                    ),
                    _buildMenuItem(
                      Icons.pie_chart,
                      "Presentation",
                      Colors.orange,
                    ),
                    _buildMenuItem(
                      Icons.print,
                      "Print products",
                      Colors.deepPurpleAccent,
                    ),
                    _buildMenuItem(Icons.article, "Doc", Colors.teal),
                    _buildMenuItem(Icons.web, "Website", Colors.blueAccent),
                    _buildMenuItem(
                      Icons.email,
                      "Email",
                      Colors.indigoAccent,
                      isNew: true,
                    ),
                    _buildMenuItem(Icons.grid_view, "Whiteboard", Colors.green),
                    _buildMenuItem(Icons.table_chart, "Sheet", Colors.blue),
                    _buildMenuItem(
                      Icons.aspect_ratio,
                      "Custom size",
                      Colors.white24,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),

      // ===== BOTTOM NAVIGATION =====
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF181818),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_open),
            label: 'Your Designs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'Templates',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  // ===== HELPER MENU ITEM =====
  static Widget _buildMenuItem(
    IconData icon,
    String label,
    Color color, {
    bool isNew = false,
  }) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            if (isNew)
              Positioned(
                top: -5,
                right: -5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "New",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
      ],
    );
  }
}
