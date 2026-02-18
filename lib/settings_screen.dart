import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: false,
            onChanged: (v) {},
          ),
          SwitchListTile(
            title: const Text("Notifications"),
            value: true,
            onChanged: (v) {},
          ),
          ListTile(
            title: const Text("Study Reminder Time"),
            subtitle: const Text("30 Minutes"),
            trailing: const Icon(Icons.arrow_drop_down),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
