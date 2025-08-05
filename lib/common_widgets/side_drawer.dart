import 'package:flutter/material.dart';
import 'package:teq_mavens_assignment/common_widgets/diamond_icon.dart';

class SideDrawer extends StatelessWidget {
  final VoidCallback? onClose;
  const SideDrawer({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/profile_drawer_background.png'),
          fit: BoxFit.cover,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF23244D), Color(0xFF191B2D)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 24,
            offset: Offset(4, 0),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with profile
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white24,
                      border: Border.all(color: Colors.white30, width: 2),
                    ),
                    child: const Center(
                      child: Icon(Icons.person, color: Colors.white54, size: 32),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Alice Portman',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Show Profile',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white54),
                    onPressed: onClose,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Account Setting', style: TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
            _drawerItem(Icons.notifications, 'Notifications', trailing: _notificationBadge(12)),
            const Divider(color: Colors.white12, thickness: 1, indent: 24, endIndent: 24),
            _drawerItem(Icons.credit_card, 'Payment'),
            const Divider(color: Colors.white12, thickness: 1, indent: 24, endIndent: 24),
            _drawerItem(Icons.translate, 'Translate'),
            const Divider(color: Colors.white12, thickness: 1, indent: 24, endIndent: 24),
            _drawerItem(Icons.privacy_tip, 'Privacy'),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Hosting', style: TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
            _drawerItem(Icons.list_alt, 'Listing'),
            const Divider(color: Colors.white12, thickness: 1, indent: 24, endIndent: 24),
            _drawerItem(Icons.person, 'Host'),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('More', style: TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
            _drawerItem(Icons.nightlight_round, 'Dark Mode', trailing: _darkModeSwitch()),
            const Divider(color: Colors.white12, thickness: 1, indent: 24, endIndent: 24),
            _drawerItem(Icons.update, 'Update'),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  static Widget _drawerItem(IconData icon, String title, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        leading: DiamondIcon(
          icon: icon,
          size: 20,
          iconColor: Colors.white,
          backgroundColor: const Color(0xFF2F3455),
          diamondSize: 40,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: trailing,
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        hoverColor: Colors.white10,
      ),
    );
  }

  static Widget _notificationBadge(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text('$count', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  static Widget _darkModeSwitch() {
    return Switch(
      value: true,
      onChanged: (v) {},
      activeColor: Colors.blueAccent,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.white24,
    );
  }
}
