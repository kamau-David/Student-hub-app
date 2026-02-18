import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final tasks = [
    {'title': 'Complete Flutter Tutorial', 'done': true},
    {'title': 'Finish Math  Assignment', 'done': false},
    {'title': 'Read chapter four in textbook', 'done': false},
    {'title': 'Plan group meeting', 'done': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          elevation: 8,
          shadowColor: Colors.black45,
          borderRadius: BorderRadius.circular(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Theme.of(context).cardColor,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tasks.length,
                separatorBuilder: (context, index) =>
                    Divider(height: 1, indent: 16, endIndent: 16),
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: tasks[index]['done'] as bool,
                    title: Text(
                      tasks[index]['title'] as String,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onChanged: (val) {},
                    activeColor: Colors.blue[800],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  );
                },
              ),
            ),
          ),
        ),
      ),

      // ListView.builder(
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      //   itemCount: tasks.length,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       elevation: 3,
      //       margin: const EdgeInsets.symmetric(horizontal: 4),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //       child: CheckboxListTile(
      //         value: tasks[index]['done'] as bool,
      //         title: Text(
      //           tasks[index]['title'] as String,
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      //         ),
      //         onChanged: (val) {},
      //         controlAffinity: ListTileControlAffinity.leading,
      //         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      //         activeColor: Colors.green,
      //       ),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        backgroundColor: const Color(0xFF1976D2),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
