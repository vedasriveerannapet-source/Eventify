import 'pages/events_page.dart';
import 'package:flutter/material.dart';
import 'pages/schedule_page.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'theme/app_theme.dart';
import 'pages/contact_page.dart';
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

  @override
  Widget build(BuildContext context) {
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                menuItems.length,
                    (index) => TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
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
          ),
          const SizedBox(width: 20),
        ],
      ),



      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomePage(),
          AboutPage(),
          EventsPage(),
          SchedulePage(),
          ContactPage(),
        ],
      ),


    );
  }
}
