import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if we are currently in dark mode
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Profile Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              // Keep the primary blue, or go darker in dark mode
              color: isDark ? Colors.blue[900] : const Color(0xFF1976D2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome, Alex!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Alex Johnson",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      "Computer Science",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Metric Cards Row
          Row(
            children: [
              _buildMetricCard(
                context, // Pass context to access theme
                "Today's Classes",
                "3 Classes",
                Icons.calendar_today,
                Colors.blue,
              ),
              const SizedBox(width: 12),
              _buildMetricCard(
                context,
                "Tasks Due",
                "5 Tasks",
                Icons.assignment,
                Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 20),

          _buildMetricCard(
            context,
            "Study Streak",
            "5 Days",
            Icons.local_fire_department,
            Colors.orange,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context, // Added context
    String title,
    String value,
    IconData icon,
    Color color, {
    bool isFullWidth = false,
  }) {
    Widget cardContent = Material(
      // Use Material for elevation/shadows
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor, // Automatically adapts to Dark/Light
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return isFullWidth ? cardContent : Expanded(child: cardContent);
  }
}
