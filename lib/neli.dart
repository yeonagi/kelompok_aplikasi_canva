import 'package:flutter/material.dart';

void main() => runApp(const CanvaCloneApp());

class CanvaCloneApp extends StatelessWidget {
  const CanvaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CanvaHomePage(),
    );
  }
}

class CanvaHomePage extends StatefulWidget {
  const CanvaHomePage({super.key});

  @override
  State<CanvaHomePage> createState() => _CanvaHomePageState();
}

class _CanvaHomePageState extends State<CanvaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ================= BODY (DIGANTI) =================
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recents",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // ===== PROJECT LIST =====
                Expanded(
                  child: ListView(
                    children: const [
                      ProjectTile(
                        title: "Photocard",
                        detail: "1080 x 1080 px",
                        isPrivate: true,
                        type: ProjectType.image,
                        imagePath: "assets/images/neli5.jpeg",
                      ),
                      ProjectTile(
                        title: "Banner Konser Blackpink",
                        detail: "Banner Sedang (AS) (Horizontal)",
                        isPrivate: true,
                        type: ProjectType.image,
                        imagePath: "assets/images/neli4.jpeg",
                      ),
                      ProjectTile(
                        title: "Untitled Design",
                        detail: "Instagram Post",
                        isPrivate: true,
                        type: ProjectType.instagram,
                        imagePath: "assets/images/neli2.jpeg",
                      ),
                      ProjectTile(
                        title: "CV",
                        detail: "A4",
                        isPrivate: true,
                        type: ProjectType.document,
                        imagePath: "assets/images/neli3.jpeg",
                      ),
                      ProjectTile(
                        title: "Kelompok 2 TIK",
                        detail: "Presentation",
                        isPrivate: false,
                        type: ProjectType.presentation,
                        imagePath: "assets/images/neli1.jpeg",
                      ),
                    ],
                  ),
                ),

                Center(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("See all recents"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ================= BOTTOM NAVIGATION (TETAP) =================
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
}

// ================= PROJECT TILE =================

enum ProjectType { image, instagram, presentation, document }

class ProjectTile extends StatelessWidget {
  final String title, detail, imagePath;
  final bool isPrivate;
  final ProjectType type;

  const ProjectTile({
    super.key,
    required this.title,
    required this.detail,
    required this.imagePath,
    required this.isPrivate,
    required this.type,
  });

  IconData get icon => {
    ProjectType.image: Icons.image,
    ProjectType.instagram: Icons.camera_alt,
    ProjectType.presentation: Icons.slideshow,
    ProjectType.document: Icons.description,
  }[type]!;

  Color get iconColor => {
    ProjectType.image: Colors.blueAccent,
    ProjectType.instagram: Colors.pinkAccent,
    ProjectType.presentation: Colors.orangeAccent,
    ProjectType.document: Colors.greenAccent,
  }[type]!;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            width: 48,
            height: 48,
            color: Colors.grey.shade800,
            child: Icon(icon, color: iconColor),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          if (isPrivate) ...[
            const Icon(Icons.lock, size: 14, color: Colors.white70),
            const SizedBox(width: 4),
            const Text(
              "Private",
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
            const SizedBox(width: 8),
          ],
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 4),
          Text(
            detail,
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
