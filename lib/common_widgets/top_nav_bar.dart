import 'package:flutter/material.dart';

class CustomTopNav extends StatelessWidget {
  final VoidCallback? onMenuTap;
  const CustomTopNav({Key? key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Floating rotated container with straight hamburger icon (left)
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onMenuTap,
                child: Transform.rotate(
                  angle: 0.9, // Rotate the container
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF2F3455),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Transform.rotate(
                      angle: -0.9, // Counter-rotate the icon to keep it straight
                      child: Icon(Icons.menu, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Text('')),
            // Search Bar
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 262,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF2F3455),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white54, size: 20),
                    SizedBox(width: 12),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Where to?",
                          style: TextStyle(color: Colors.white60, fontSize: 16),
                        ),
                      ),
                    ),
                    Icon(Icons.mic, color: Colors.white54, size: 20),
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: Text('')),
          ],
        ),
      ),
    );
  }
}
