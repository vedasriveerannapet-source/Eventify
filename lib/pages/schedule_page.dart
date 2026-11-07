
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {

    final schedules = [
      {
        'event': 'Music Festival',
        'date': '15 December 2026',
        'time': '10:00 AM - 5:00 PM',
        'venue': 'Hyderabad',
        'icon': Icons.music_note,
      },
      {
        'event': 'Tech Conference',
        'date': '20 December 2026',
        'time': '09:00 AM - 4:00 PM',
        'venue': 'Bangalore',
        'icon': Icons.computer,
      },
      {
        'event': 'Art Exhibition',
        'date': '25 December 2026',
        'time': '11:00 AM - 6:00 PM',
        'venue': 'Chennai',
        'icon': Icons.palette,
      },
      {
        'event': 'Food Carnival',
        'date': '28 December 2026',
        'time': '12:00 PM - 8:00 PM',
        'venue': 'Hyderabad',
        'icon': Icons.restaurant,
      },
      {
        'event': 'Startup Meetup',
        'date': '05 January 2027',
        'time': '10:00 AM - 3:00 PM',
        'venue': 'Mumbai',
        'icon': Icons.lightbulb,
      },
      {
        'event': 'Dance Competition',
        'date': '10 January 2027',
        'time': '04:00 PM - 8:00 PM',
        'venue': 'Delhi',
        'icon': Icons.theater_comedy,
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [

          // Heading Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(60),
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
                  'PLAN YOUR EXPERIENCE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Event Schedule',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Check dates, timings and venues of upcoming events.',
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

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upcoming Event Timetable',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Schedule Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: schedules.map((schedule) {

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [

                      // Event Icon
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppTheme.lightPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          schedule['icon'] as IconData,
                          color: AppTheme.primary,
                          size: 32,
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Event Information
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              schedule['event'] as String,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkText,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Wrap(
                              spacing: 18,
                              runSpacing: 10,
                              children: [

                                infoItem(
                                  Icons.calendar_month,
                                  schedule['date'] as String,
                                ),

                                infoItem(
                                  Icons.access_time,
                                  schedule['time'] as String,
                                ),

                                infoItem(
                                  Icons.location_on,
                                  schedule['venue'] as String,
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

              }).toList(),
            ),
          ),

          const SizedBox(height: 40),

          // Bottom Message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(35),
            color: AppTheme.lightPurple,
            child: const Column(
              children: [
                Icon(
                  Icons.event_available,
                  color: AppTheme.primary,
                  size: 45,
                ),
                SizedBox(height: 12),
                Text(
                  'Never Miss an Event!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore our events and be part of something special.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget infoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: AppTheme.secondary,
          size: 18,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
