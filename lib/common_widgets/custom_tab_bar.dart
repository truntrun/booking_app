import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomBottomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomBottomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Color(0xFF2F3455).withOpacity(0.9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTabIcon(
              icon: CupertinoIcons.location,
              index: 0,
              isActive: selectedIndex == 0,
            ),
            _buildTabIcon(
              icon: CupertinoIcons.airplane,
              index: 1,
              isActive: selectedIndex == 1,
            ),
            _buildTabIcon(
              icon: CupertinoIcons.heart,
              index: 2,
              isActive: selectedIndex == 2,
            ),
            _buildTabIcon(
              icon: Icons.chat_bubble,
              index: 3,
              isActive: selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon({
    required IconData icon,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isActive)
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.blue.withOpacity(0.4), Colors.transparent],
                  center: Alignment.center,
                  radius: 0.8,
                ),
              ),
            ),
          Icon(
            icon,
            size: 24,
            color: isActive ? Colors.cyanAccent : Colors.blueGrey[200],
          ),
        ],
      ),
    );
  }
}
