
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  String? selectedEvent;

  final List<String> events = [
    'Music Festival',
    'Tech Conference',
    'Art Exhibition',
    'Food Carnival',
    'Startup Meetup',
    'Dance Competition',
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final registeredName = nameController.text.trim();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Registration Successful!'),
          content: Text(
            'Thank you, $registeredName!\n\n'
                'Your registration for $selectedEvent '
                'has been recorded in this demo.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

      _formKey.currentState!.reset();
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      messageController.clear();

      setState(() {
        selectedEvent = null;
      });
    }
  }

  InputDecoration fieldDecoration(
      String label,
      IconData icon,
      ) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: AppTheme.primary,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppTheme.lightPurple,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppTheme.primary,
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          // Heading Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 65,
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
                  'JOIN THE EXPERIENCE',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 3,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Register for an Event',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Fill in your details and join the celebration!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 45),

          // Registration Form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Container(
                width: 550,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        'Event Registration',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'Please enter your information below.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Name
                      TextFormField(
                        controller: nameController,
                        decoration: fieldDecoration(
                          'Full Name',
                          Icons.person,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Email
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: fieldDecoration(
                          'Email Address',
                          Icons.email,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'Please enter your email';
                          }

                          final email = value.trim();
                          if (!RegExp(
                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                          ).hasMatch(email)) {
                            return 'Enter a valid email address';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Phone
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: fieldDecoration(
                          'Phone Number',
                          Icons.phone,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'Please enter your phone number';
                          }

                          if (!RegExp(
                            r'^[0-9]{10}$',
                          ).hasMatch(value.trim())) {
                            return 'Enter a valid 10-digit number';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Event Dropdown
                      DropdownButtonFormField<String>(
                        initialValue: selectedEvent,
                        isExpanded: true,
                        decoration: fieldDecoration(
                          'Select Event',
                          Icons.event,
                        ),
                        items: events.map((event) {
                          return DropdownMenuItem<String>(
                            value: event,
                            child: Text(event),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedEvent = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an event';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Message
                      TextFormField(
                        controller: messageController,
                        maxLines: 3,
                        decoration: fieldDecoration(
                          'Message (Optional)',
                          Icons.message,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 50),

          // Contact Information
          Container(
            width: double.infinity,
            color: AppTheme.lightPurple,
            padding: const EdgeInsets.all(35),
            child: const Column(
              children: [
                Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: AppTheme.primary,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text('contact@eventify.example'),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppTheme.primary,
                    ),
                    SizedBox(width: 10),
                    Text('Hyderabad, India'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
