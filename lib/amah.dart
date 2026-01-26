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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= PROJECTS =================
                _searchBar(),
                const SizedBox(height: 12),
                _filterRow(),
                const SizedBox(height: 20),

                const Text(
                  "Recents",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                _projectList(),

                const SizedBox(height: 20),

                Center(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("See all recents"),
                  ),
                ),

                const SizedBox(height: 40),

                // ================= DISCOVER APPS =================
                const Text(
                  "Discover apps",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                const Text(
                  "New and noteworthy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                const AppItem(
                  title: "Text to Pixel",
                  subtitle: "Turn text into pixel art with custom styles",
                  icon: Icons.grid_on,
                  color: Colors.deepPurple,
                ),
                const AppItem(
                  title: "AI Avatar Video",
                  subtitle: "Create expressive avatar videos from your photos",
                  icon: Icons.play_circle_fill,
                  color: Colors.blue,
                ),
                const AppItem(
                  title: "Gen Vibe",
                  subtitle: "Bring your selfies to life with AI vibes",
                  icon: Icons.face,
                  color: Colors.orange,
                ),
                const AppItem(
                  title: "Relight",
                  subtitle: "Adjust photo lighting with AI precision",
                  icon: Icons.lightbulb,
                  color: Colors.pink,
                ),
                const AppItem(
                  title: "Clone Brush",
                  subtitle: "Remove unwanted image elements seamlessly",
                  icon: Icons.brush,
                  color: Colors.green,
                ),
                const AppItem(
                  title: "Mask Pro",
                  subtitle: "Create stunning clipping masks with custom shapes",
                  icon: Icons.crop,
                  color: Colors.red,
                ),
                const AppItem(
                  title: "List Styler",
                  subtitle: "Style and customize text lists",
                  icon: Icons.format_list_bulleted,
                  color: Colors.redAccent,
                ),
                const AppItem(
                  title: "Emoji Maker",
                  subtitle: "Create your own emojis easily",
                  icon: Icons.emoji_emotions,
                  color: Colors.lightGreen,
                ),
                const AppItem(
                  title: "Convert Case",
                  subtitle: "Transform text into various cases quickly",
                  icon: Icons.text_fields,
                  color: Colors.teal,
                ),
                const AppItem(
                  title: "Crossword AI",
                  subtitle: "Generate customizable AI crossword puzzles",
                  icon: Icons.edit,
                  color: Colors.grey,
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),

      // ================= BOTTOM NAV =================
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

  // ================= PROJECT COMPONENTS =================

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(25),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: "Search across all content",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _filterRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _filter("Type", ["Design", "Presentation", "Video"]),
          _filter("Category", ["Personal", "School", "Work"]),
          _filter("Owner", ["Me", "Team"]),
          _filter("Date modified", ["Today", "This week", "This month"]),
        ],
      ),
    );
  }

  static Widget _filter(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: PopupMenuButton<String>(
        itemBuilder: (_) =>
            items.map((e) => PopupMenuItem(value: e, child: Text(e))).toList(),
        child: OutlinedButton(
          onPressed: null,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Text(title),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _projectList() {
    return Column(
      children: const [
        ProjectTile(
          title: "Photocard",
          detail: "1080 x 1080 px",
          isPrivate: true,
          type: ProjectType.image,
          imagePath: "asset/photocard.jpeg",
        ),
        ProjectTile(
          title: "Banner Konser Blackpink",
          detail: "Banner Sedang (AS) (Horizontal)",
          isPrivate: true,
          type: ProjectType.image,
          imagePath: "asset/banner.jpeg",
        ),
        ProjectTile(
          title: "Untitled Design",
          detail: "Instagram Post",
          isPrivate: true,
          type: ProjectType.instagram,
          imagePath: "asset/instagram.jpeg",
        ),
        ProjectTile(
          title: "CV",
          detail: "A4",
          isPrivate: true,
          type: ProjectType.document,
          imagePath: "asset/cv.jpeg",
        ),
        ProjectTile(
          title: "Kelompok 2 TIK",
          detail: "Presentation",
          isPrivate: false,
          type: ProjectType.presentation,
          imagePath: "asset/presentation.jpeg",
        ),
      ],
    );
  }
}

// ================= MODELS & WIDGETS =================

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

class AppItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const AppItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
