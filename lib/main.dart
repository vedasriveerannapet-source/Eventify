import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/events_page.dart';
import 'pages/schedule_page.dart';
import 'pages/contact_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const EventifyApp());
}

class EventifyApp extends StatelessWidget {
  const EventifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eventify',
      theme: AppTheme.theme,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<String> menuItems = [
    'Home',
    'About',
    'Events',
    'Schedule',
    'Contact',
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Eventify',
          style: TextStyle(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          if (isMobile)
            PopupMenuButton<int>(
              icon: const Icon(
                Icons.menu,
                color: AppTheme.primary,
              ),
              onSelected: changePage,
              itemBuilder: (context) {
                return List.generate(
                  menuItems.length,
                      (index) => PopupMenuItem<int>(
                    value: index,
                    child: Text(
                      menuItems[index],
                      style: TextStyle(
                        color: selectedIndex == index
                            ? AppTheme.primary
                            : Colors.black87,
                        fontWeight: selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            )
          else
            Row(
              children: List.generate(
                menuItems.length,
                    (index) => TextButton(
                  onPressed: () => changePage(index),
                  child: Text(
                    menuItems[index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? AppTheme.primary
                          : Colors.black87,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(width: 15),
        ],
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomePage(
            onExploreEvents: () => changePage(2),
          ),
          const AboutPage(),
          EventsPage(
            onRegister: () => changePage(4),
          ),
          const SchedulePage(),
          const ContactPage(),
        ],
      ),
    );
  }
}