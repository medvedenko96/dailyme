import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../pages/auth_page.dart';
import '../pages/profile_page.dart';
import '../pages/home_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              AuthService().currentUserEmail ?? 'user@example.com',
              style: const TextStyle(fontSize: 14),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.deepPurple,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.deepPurple),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to home page, replacing current page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.deepPurple),
            title: const Text('Calendar'),
            onTap: () {
              Navigator.pop(context);
              _showComingSoonSnackBar(context, 'Calendar');
            },
          ),
          ListTile(
            leading: const Icon(Icons.task_alt, color: Colors.deepPurple),
            title: const Text('Tasks'),
            onTap: () {
              Navigator.pop(context);
              _showComingSoonSnackBar(context, 'Tasks');
            },
          ),
          ListTile(
            leading: const Icon(Icons.note, color: Colors.deepPurple),
            title: const Text('Notes'),
            onTap: () {
              Navigator.pop(context);
              _showComingSoonSnackBar(context, 'Notes');
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics, color: Colors.deepPurple),
            title: const Text('Analytics'),
            onTap: () {
              Navigator.pop(context);
              _showComingSoonSnackBar(context, 'Analytics');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.deepPurple),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              _showComingSoonSnackBar(context, 'Settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.deepPurple),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.pop(context);
              _showComingSoonSnackBar(context, 'Help & Support');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.deepPurple),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              _showAboutDialog(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showComingSoonSnackBar(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature feature coming soon!'),
        backgroundColor: Colors.deepPurple,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About DailyMe'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DailyMe',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8),
              Text('Version 1.0.0'),
              SizedBox(height: 16),
              Text(
                'A personal productivity app to help you manage your daily tasks, notes, and schedule.',
              ),
              SizedBox(height: 16),
              Text(
                'Built with Flutter ❤️',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Logout and navigate back to auth page
                AuthService().logout();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
