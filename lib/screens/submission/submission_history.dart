import 'package:flutter/material.dart';

class SubmissionHistoryScreen extends StatelessWidget {
  const SubmissionHistoryScreen({super.key});

  final List<Map<String, dynamic>> history = const [
    {
      "date": "14 Sept 2025",
      "submitted": "2/2",
      "status": "Verified",
      "icon": Icons.check_circle,
      "color": Colors.green,
    },
    {
      "date": "13 Sept 2025",
      "submitted": "1/2",
      "status": "Rejected (Q2 missing)",
      "icon": Icons.cancel,
      "color": Colors.red,
    },
    {
      "date": "12 Sept 2025",
      "submitted": "2/2",
      "status": "Pending",
      "icon": Icons.hourglass_bottom,
      "color": Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Submission History"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(item["icon"], color: item["color"]),
              title: Text(item["date"],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Questions: ${item["submitted"]}"),
              trailing: Text(item["status"],
                  style: TextStyle(
                      color: item["color"], fontWeight: FontWeight.w600)),
            ),
          );
        },
      ),
    );
  }
}