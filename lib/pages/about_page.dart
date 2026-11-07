
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          // Heading Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(65),
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
                  'ABOUT EVENTIFY',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 3,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'We Make Events Special!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Creating memorable experiences for everyone.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 45),

          // About Information
          Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              children: [
                const Icon(
                  Icons.celebration,
                  size: 65,
                  color: AppTheme.primary,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Who We Are',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Eventify is an event management platform '
                      'that helps people discover and explore '
                      'different events. Our goal is to make '
                      'every celebration and gathering special.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.7,
                  ),
                ),

                const SizedBox(height: 45),

                // Mission and Vision
                Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  alignment: WrapAlignment.center,
                  children: [
                    infoCard(
                      Icons.flag,
                      'Our Mission',
                      'To make event planning simple, '
                          'creative and enjoyable.',
                    ),

                    infoCard(
                      Icons.visibility,
                      'Our Vision',
                      'To create unforgettable '
                          'experiences through events.',
                    ),
                  ],
                ),

                const SizedBox(height: 45),

                const Text(
                  'Why Choose Eventify?',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  '✓ Easy event discovery\n\n'
                      '✓ Organized event schedules\n\n'
                      '✓ Simple registration process\n\n'
                      '✓ Memorable experiences',
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(
      IconData icon,
      String title,
      String description,
      ) {
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
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppTheme.primary,
            size: 40,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
