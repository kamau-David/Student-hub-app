import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onToggle;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      // To get the "Floating" look from your diagram, we can wrap the Column in a Card
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Shrink to fit the items
          children: [
            SwitchListTile(
              title: const Text("Dark Mode"),
              subtitle: Text(
                isDarkMode ? "Dark Mode is ON" : "Dark Mode is OFF",
              ),
              // FIXED: Use the variable here, not 'false'
              value: isDarkMode,
              onChanged: (v) => onToggle(v),
            ),
            const Divider(height: 1),
            const ListTile(
              title: Text("Notifications"),
              trailing: Icon(Icons.notifications_active),
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text("Study Reminder Time"),
              subtitle: const Text("30 Minutes"),
              trailing: const Icon(Icons.arrow_drop_down),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
