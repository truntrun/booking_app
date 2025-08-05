import 'package:flutter/material.dart';

class DiamondIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final Color backgroundColor;
  final double diamondSize;

  const DiamondIcon({
    Key? key,
    required this.icon,
    this.size = 20,
    this.iconColor = Colors.white,
    this.backgroundColor = const Color(0xFF2F3455),
    this.diamondSize = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.9, // Diamond shape
      child: Container(
        width: diamondSize,
        height: diamondSize,
        decoration: BoxDecoration(
          color: backgroundColor,
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
          angle: -0.9, // Keep icon straight
          child: Icon(icon, color: iconColor, size: size),
        ),
      ),
    );
  }
}
