import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teq_mavens_assignment/common_widgets/categories_selector.dart';
import 'package:teq_mavens_assignment/common_widgets/custom_tab_bar.dart';
import 'package:teq_mavens_assignment/common_widgets/homepage_card.dart';
import 'package:teq_mavens_assignment/common_widgets/top_nav_bar.dart';
import 'package:teq_mavens_assignment/common_widgets/side_drawer.dart';
import 'property_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1B2E),
        primarySwatch: Colors.blue,
      ),
      home: const TravelBookingScreen(),
    );
  }
}

class TravelBookingScreen extends StatefulWidget {
  const TravelBookingScreen({super.key});

  @override
  State<TravelBookingScreen> createState() => _TravelBookingScreenState();
}

class _TravelBookingScreenState extends State<TravelBookingScreen> {
  int _selectedTabIndex = 0;
  int _selectedBottomIndex = 0;

  final List<String> _tabItems = ['Cabins', 'Hotels', 'Pool', 'Camping'];
  final List<IconData> _tabIcons = [
    Icons.home,
    Icons.hotel,
    Icons.pool,
    Icons.nature,
  ];

  bool _drawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1B2E),
      body: Stack(
        children: [
          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Top Search Bar
                CustomTopNav(onMenuTap: () {
                  setState(() {
                    _drawerOpen = true;
                  });
                }),
                const SizedBox(height: 20),
                // Horizontal Tab Bar
                CategorySelector(),
                const SizedBox(height: 20),
                // Travel Cards List
                Expanded(child: _buildTravelCardsList()),
              ],
            ),
          ),
          // Animated Side Drawer
          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOut,
            top: 0,
            bottom: 0,
            left: _drawerOpen ? 0 : -MediaQuery.of(context).size.width * 0.8,
            child: SideDrawer(
              onClose: () {
                setState(() {
                  _drawerOpen = false;
                });
              },
            ),
          ),
          // Drawer overlay (tap to close)
          if (_drawerOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _drawerOpen = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.35),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomBottomTabBar(
        selectedIndex: _selectedBottomIndex,
        onTabSelected: (index) {
          setState(() {
            _selectedBottomIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2B3E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.menu, color: Colors.white70),
            const SizedBox(width: 12),
            const Icon(Icons.search, color: Colors.white70),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Where to?',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            const Icon(Icons.mic, color: Colors.white70),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelCardsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 3, // Show 3 cards for demo
      itemBuilder: (context, index) {
        return _buildTravelCard(index);
      },
    );
  }

  Widget _buildTravelCard(int index) {
    final List<Map<String, dynamic>> cardData = [
      {
        'location': 'Toronto, Canada',
        'cost': '\$200 CAD / night',
        'distance': '257km',
        'availability': 'Oct 24 - 26',
        'rating': '4.1',
        'reviews': '1,648',
        'host': 'Trang',
        'hostCategory': 'Luxury, Lifestyle',
        'address': '1155 Rue Sherbrooke Ouest, Toronto, Canada H3A 2N3',
        'isSuperhostBadge': true,
      },
      {
        'location': 'Vancouver, Canada',
        'cost': '\$180 CAD / night',
        'distance': '312km',
        'availability': 'Oct 25 - 27',
        'rating': '4.3',
        'reviews': '2,156',
        'host': 'Sarah',
        'hostCategory': 'Modern, Cozy',
        'address': '789 Granville Street, Vancouver, Canada V6Z 1K3',
        'isSuperhostBadge': true,
      },
      {
        'location': 'Montreal, Canada',
        'cost': '\$150 CAD / night',
        'distance': '189km',
        'availability': 'Oct 26 - 28',
        'rating': '4.0',
        'reviews': '1,432',
        'host': 'Pierre',
        'hostCategory': 'Historic, Charming',
        'address': '456 Saint-Laurent Blvd, Montreal, Canada H2X 2T1',
        'isSuperhostBadge': false,
      },
    ];

    final data = cardData[index % cardData.length];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailsPage(propertyData: data),
          ),
        );
      },
      child: TravelCard(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFF2A2B3E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomNavItem(Icons.location_on, 0),
          _buildBottomNavItem(Icons.flight, 1),
          _buildBottomNavItem(Icons.favorite_border, 2),
          _buildBottomNavItem(Icons.menu, 3),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, int index) {
    final isSelected = _selectedBottomIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBottomIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4A90E2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white54,
          size: 24,
        ),
      ),
    );
  }
}
