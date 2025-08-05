import 'package:flutter/material.dart';
import 'dart:ui';

class TravelCard extends StatelessWidget {
  const TravelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 351,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x00313A5B), // 0% opacity
            Color(0xFF313A5B), // 100% opacity at 45%
            Color(0x38313A5B), // 22% opacity (hex: 38 = 22% alpha)
            Color(0xFF21273D), // Full opacity
          ],
          stops: [0.0, 0.45, 0.45, 1.0],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Background image
            Image.asset(
              'assets/property_pic.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            // Blur effect overlay
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: Container(color: Colors.black.withOpacity(0.1)),
            ),

            // Top overlay: rating and heart icon

            // Bottom info section with blur effect
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Toronto, Canada',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _infoItem(
                                Icons.attach_money,
                                'COST',
                                '200 CAD / night',
                              ),
                            ),
                            Container(
                              height: 35,
                              width: 1,
                              color: Colors.white.withOpacity(0.2),
                              margin: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            Expanded(
                              child: _infoItem(
                                Icons.navigation,
                                'DISTANCE',
                                '257km',
                              ),
                            ),
                            Container(
                              height: 35,
                              width: 1,
                              color: Colors.white.withOpacity(0.2),
                              margin: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            Expanded(
                              child: _infoItem(
                                Icons.date_range,
                                'AVAILABLE',
                                'Oct 24 - 26',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoItem(IconData icon, String title, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 16),
            SizedBox(width: 4),
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
