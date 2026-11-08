import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EventsPage extends StatelessWidget {
  final VoidCallback onRegister;

  const EventsPage({
    super.key,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

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
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 40 : 65,
              horizontal: 20,
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
              children: [
                const Text(
                  'EXPLORE EXPERIENCES',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 2,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Upcoming Events',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 29 : 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 35,
            ),
            child: const Align(
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

          // Responsive Event Cards
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 35,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = constraints.maxWidth < 600
                    ? constraints.maxWidth
                    : constraints.maxWidth < 950
                    ? (constraints.maxWidth - 22) / 2
                    : (constraints.maxWidth - 44) / 3;

                return Wrap(
                  spacing: 22,
                  runSpacing: 22,
                  alignment: WrapAlignment.center,
                  children: events.map((event) {
                    return SizedBox(
                      width: cardWidth,
                      child: Container(
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
                                Expanded(
                                  child: Text(
                                    event['date'] as String,
                                  ),
                                ),
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
                                Expanded(
                                  child: Text(
                                    event['venue'] as String,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // View Details Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return AlertDialog(
                                        title: Text(
                                          event['name'] as String,
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Category: ${event['category']}',
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Date: ${event['date']}',
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Venue: ${event['venue']}',
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(dialogContext);
                                            },
                                            child: const Text('Close'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(dialogContext);
                                              onRegister();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              AppTheme.primary,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: const Text('Register'),
                                          ),
                                        ],
                                      );
                                    },
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
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}