import 'package:doctor_appointment/feature/appointments/appointment_screen.dart';
import 'package:doctor_appointment/feature/message/message_screen.dart';
import 'package:doctor_appointment/feature/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'category_screen.dart'; // Import the category screen
import 'widgets/category_item.dart';
import 'widgets/doctor_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String selectedCategory =
      "Heart"; // Default category to show heart specialists

  // Screens for Bottom Navigation
  final List<Widget> _screens = [
    HomeScreenContent(), // Home page content
    AppointmentsScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Change screen dynamically
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Appointments"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Extracted Home Page Content
class HomeScreenContent extends StatefulWidget {
  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  String selectedCategory = "Heart";

  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Selkon Kane",
      "specialty": "Heart",
      "image": "assets/doctor_1.jpg"
    },
    {
      "name": "Dr. Watson Mushef",
      "specialty": "Heart",
      "image": "assets/doctor_2.jpg"
    },
    {
      "name": "Dr. Emily Smith",
      "specialty": "Dental",
      "image": "assets/doctor_3.jpg"
    },
    {
      "name": "Dr. Robert Brown",
      "specialty": "Dental",
      "image": "assets/doctor_4.jpg"
    },
    {
      "name": "Dr. Alice Johnson",
      "specialty": "Brain",
      "image": "assets/doctor_5.jpg"
    },
    {
      "name": "Dr. Michael Lee",
      "specialty": "Brain",
      "image": "assets/doctor_6.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredDoctors = doctors
        .where((doctor) => doctor["specialty"] == selectedCategory)
        .toList();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, size: 28),
                CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/profile.png')),
              ],
            ),
            SizedBox(height: 20),

            /// Title
            Text(
              "Find your desired\nspecialist",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            /// Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search for doctor",
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.search, color: Colors.blue),
                      onPressed: () {}),
                ],
              ),
            ),
            SizedBox(height: 24),

            /// Categories
            Text("Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(
                          onCategorySelected: (category) {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2),
                            ]),
                        child:
                            Icon(Icons.category, size: 28, color: Colors.blue),
                      ),
                      SizedBox(height: 6),
                      Text("See All", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                CategoryItemWidget(
                    icon: Icons.favorite,
                    title: "Heart",
                    selectedCategory: selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    }),
                CategoryItemWidget(
                    icon: Icons.medical_services,
                    title: "Dental",
                    selectedCategory: selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    }),
                CategoryItemWidget(
                    icon: Icons.psychology,
                    title: "Brain",
                    selectedCategory: selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    }),
              ],
            ),
            SizedBox(height: 24),

            /// Specialist List
            Text("$selectedCategory Specialists",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return DoctorCardWidget(
                      name: doctor["name"]!,
                      specialty: doctor["specialty"]!,
                      imagePath: doctor["image"]!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
