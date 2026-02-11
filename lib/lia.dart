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
  int pressedIndex = -1;
  int pressedBoxIndex = -1;

  final List<String> templates = [
    'Education\nPresentation',
    'Worksheet',
    'Doc',
    'Email',
    'Education\nWebsite',
    'Poster',
    'Education\nWhiteboard',
    'Sheet',
  ];

  final List<IconData> icons = [
    Icons.slideshow,
    Icons.assignment,
    Icons.description,
    Icons.email,
    Icons.language,
    Icons.image,
    Icons.draw,
    Icons.table_chart,
  ];

  final List<String> moreTemplateImages = [
    'assets/images/fotolia1.jpeg',
    'assets/images/fotolia2.jpeg',
    'assets/images/fotolia3.jpeg',
    'assets/images/fotolia4.jpeg',
    'assets/images/fotolia5.jpeg',
  ];

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth;

              int crossAxisCount;
              double aspectRatio;

              if (width >= 1100) {
                crossAxisCount = 4;
                aspectRatio = 2.6;
              } else if (width >= 900) {
                crossAxisCount = 3;
                aspectRatio = 2.4;
              } else if (width >= 700) {
                crossAxisCount = 2;
                aspectRatio = 2.2;
              } else {
                crossAxisCount = 3;
                aspectRatio = 1;
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ================= HEADER =================
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "What will you learn today?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
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

                    // ================= BODY =================
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Explore templates',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: templates.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: aspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        final isPressed = pressedIndex == index;

                        return GestureDetector(
                          onTapDown: (_) =>
                              setState(() => pressedIndex = index),
                          onTapUp: (_) => setState(() => pressedIndex = -1),
                          onTapCancel: () => setState(() => pressedIndex = -1),
                          child: AnimatedScale(
                            scale: isPressed ? 0.95 : 1,
                            duration: const Duration(milliseconds: 120),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.purple.withOpacity(0.35),
                                    Colors.blue.withOpacity(0.15),
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 42,
                                      height: 42,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.85),
                                      ),
                                      child: Icon(
                                        icons[index],
                                        size: 22,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      templates[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'More templates for you',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: moreTemplateImages.length,
                        itemBuilder: (context, index) {
                          final isPressed = pressedBoxIndex == index;

                          return GestureDetector(
                            onTapDown: (_) =>
                                setState(() => pressedBoxIndex = index),
                            onTapUp: (_) =>
                                setState(() => pressedBoxIndex = -1),
                            onTapCancel: () =>
                                setState(() => pressedBoxIndex = -1),
                            child: AnimatedScale(
                              scale: isPressed ? 0.95 : 1,
                              duration: const Duration(milliseconds: 120),
                              child: Container(
                                width: 280,
                                margin: const EdgeInsets.only(right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      moreTemplateImages[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              );
            },
          ),
        ),
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Templates aktif
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
