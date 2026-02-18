import 'package:flutter/material.dart';
import 'package:student_track/home_screen.dart';
import 'package:student_track/settings_screen.dart';
import 'package:student_track/task_screen.dart';

void main() {
  runApp(const StudentTrack());
}

class StudentTrack extends StatefulWidget {
  const StudentTrack({super.key});

  @override
  State<StudentTrack> createState() => _StudentTrackState();
}

class _StudentTrackState extends State<StudentTrack> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool val) {
    setState(() {
      _isDarkMode = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'student tracker',
      home: MainContainer(isDarkMode: _isDarkMode, onToggle: _toggleDarkMode),
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1976D2)),
        // primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1976D2),
      ),
    );
  }
}

class MainContainer extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onToggle;
  const MainContainer({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      TaskScreen(),
      SettingsScreen(isDarkMode: widget.isDarkMode, onToggle: widget.onToggle),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ['Student Hub', 'Tasks', 'Settings'][_currentIndex],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.menu, color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(0xFF1976D2),
      ),
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
