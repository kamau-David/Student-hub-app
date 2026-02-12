import 'package:flutter/material.dart';
import 'package:student_track/home_screen.dart';
import 'package:student_track/settings_screen.dart';
import 'package:student_track/task_screen.dart';

void main() {
  runApp(const StudentTrack());
}

class StudentTrack extends StatelessWidget {
  const StudentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'student tracker',
      home: MainContainer(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        // primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _currentIndex = 0;

  final screens = [HomeScreen(), TaskScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.task, size: 28),
            label: 'task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 28),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
