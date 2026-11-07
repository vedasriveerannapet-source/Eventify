
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final events = [
      {
        'name': 'Music Festival',
        'date': '15 December 2026',
        'venue': 'Hyderabad',
        'category': 'Entertainment',
        'icon': Icons.music_note,
      },
      {
        'name': 'Tech Conference',
        'date': '20 December 2026',
        'venue': 'Bangalore',
        'category': 'Technology',
        'icon': Icons.computer,
      },
      {
        'name': 'Art Exhibition',
        'date': '25 December 2026',
        'venue': 'Chennai',
        'category': 'Arts',
        'icon': Icons.palette,
      },
      {
        'name': 'Food Carnival',
        'date': '28 December 2026',
        'venue': 'Hyderabad',
        'category': 'Food',
        'icon': Icons.restaurant,
      },
      {
        'name': 'Startup Meetup',
        'date': '05 January 2027',
        'venue': 'Mumbai',
        'category': 'Technology',
        'icon': Icons.lightbulb,
      },
      {
        'name': 'Dance Competition',
        'date': '10 January 2027',
        'venue': 'Delhi',
        'category': 'Entertainment',
        'icon': Icons.theater_comedy,
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [

          // Heading Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 65,
              horizontal: 25,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primary,
                  AppTheme.secondary,
                ],
              ),
            ),
            child: const Column(
              children: [
                Text(
                  'EXPLORE EXPERIENCES',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 3,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Upcoming Events',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Discover exciting events and make memories!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Events Heading
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore All Events',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Event Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Wrap(
              spacing: 22,
              runSpacing: 22,
              alignment: WrapAlignment.center,
              children: events.map((event) {

                return Container(
                  width: 290,
                  padding: const EdgeInsets.all(22),
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

                      // Event Icon
                      Container(
                        width: double.infinity,
                        height: 125,
                        decoration: BoxDecoration(
                          color: AppTheme.lightPurple,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          event['icon'] as IconData,
                          size: 65,
                          color: AppTheme.primary,
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Category
                      Text(
                        event['category'] as String,
                        style: const TextStyle(
                          color: AppTheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Event Name
                      Text(
                        event['name'] as String,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkText,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Date
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 19,
                            color: AppTheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(event['date'] as String),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Venue
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 19,
                            color: AppTheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(event['venue'] as String),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // View Details Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'You selected ${event['name']}!',
                                ),
                                backgroundColor: AppTheme.primary,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('View Details'),
                        ),
                      ),
                    ],
                  ),
                );

              }).toList(),
            ),
          ),

          const SizedBox(height: 50),

        ],
      ),
    );
  }
}
