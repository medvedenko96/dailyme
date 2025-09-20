import 'package:flutter/material.dart';
import '../components/main_layout.dart';
import '../services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Profile',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.deepPurple),
                      title: const Text('Email'),
                      subtitle: Text(AuthService().currentUserEmail ?? 'Not available'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.deepPurple),
                      title: const Text('Name'),
                      subtitle: const Text('User Name'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_today, color: Colors.deepPurple),
                      title: const Text('Member Since'),
                      subtitle: const Text('September 2025'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(Icons.edit, color: Colors.deepPurple),
                      title: const Text('Edit Profile'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Edit Profile feature coming soon!'),
                            backgroundColor: Colors.deepPurple,
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.security, color: Colors.deepPurple),
                      title: const Text('Change Password'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Change Password feature coming soon!'),
                            backgroundColor: Colors.deepPurple,
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.notifications, color: Colors.deepPurple),
                      title: const Text('Notification Settings'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Notification Settings feature coming soon!'),
                            backgroundColor: Colors.deepPurple,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
