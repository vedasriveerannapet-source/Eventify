
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Welcome Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 75,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primary,
                  AppTheme.secondary,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CREATE. CELEBRATE. CONNECT.',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 3,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Make Every Event\nUnforgettable!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Discover amazing events and create\n'
                      'memories that last forever.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppTheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 18,
                    ),
                  ),
                  child: const Text('Explore Events'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 45),

          // Featured Events Heading
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover Our Events',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Find exciting events and experiences.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // Event Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                EventCard(
                  title: 'Music Festival',
                  date: '15 December 2026',
                  icon: Icons.music_note,
                ),
                EventCard(
                  title: 'Tech Conference',
                  date: '20 December 2026',
                  icon: Icons.computer,
                ),
                EventCard(
                  title: 'Art Exhibition',
                  date: '25 December 2026',
                  icon: Icons.palette,
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),

          // About Section
          Container(
            width: double.infinity,
            color: AppTheme.lightPurple,
            padding: const EdgeInsets.all(45),
            child: const Column(
              children: [
                Text(
                  'Welcome to Eventify',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'We make event planning simple and exciting. '
                      'From music festivals to conferences, '
                      'discover experiences worth remembering.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Event Card
class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final IconData icon;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppTheme.lightPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 35,
              color: AppTheme.primary,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                size: 18,
                color: AppTheme.secondary,
              ),
              const SizedBox(width: 8),
              Text(date),
            ],
          ),
        ],
      ),
    );
  }
}
