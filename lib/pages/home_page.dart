
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onExploreEvents;

  const HomePage({
    super.key,
    required this.onExploreEvents,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Welcome Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 22 : 60,
                vertical: isMobile ? 45 : 75,
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

                  Text(
                    'Make Every Event\nUnforgettable!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    'Discover amazing events and create\n'
                        'memories that last forever.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 15 : 17,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Explore Events Button
                  ElevatedButton(
                    onPressed: widget.onExploreEvents,
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
              ),
              child: const Column(
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

            // Featured Event Cards
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = constraints.maxWidth < 600
                      ? constraints.maxWidth
                      : constraints.maxWidth < 950
                      ? (constraints.maxWidth - 20) / 2
                      : (constraints.maxWidth - 40) / 3;

                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      EventCard(
                        title: 'Music Festival',
                        date: '15 December 2026',
                        icon: Icons.music_note,
                        width: cardWidth,
                      ),

                      EventCard(
                        title: 'Tech Conference',
                        date: '20 December 2026',
                        icon: Icons.computer,
                        width: cardWidth,
                      ),

                      EventCard(
                        title: 'Art Exhibition',
                        date: '25 December 2026',
                        icon: Icons.palette,
                        width: cardWidth,
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 50),

            // About Section
            Container(
              width: double.infinity,
              color: AppTheme.lightPurple,
              padding: EdgeInsets.all(isMobile ? 25 : 45),
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
      ),
    );
  }
}

// Reusable Event Card
class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final IconData icon;
  final double width;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.icon,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(title),
              content: Text('Event Date: $date'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
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
                  Expanded(child: Text(date)),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                'Tap to view details',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
