import 'package:code2earn/screens/submission/submission_history.dart';
import 'package:flutter/material.dart';

class SubmissionAcknowledgementScreen extends StatelessWidget {
  const SubmissionAcknowledgementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 20),
              const Text(
                "Submission Received 🎉",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your proofs have been submitted for today’s challenge.\nOur team will verify them shortly.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.task_alt, color: Colors.blue),
                        title: Text("Questions submitted"),
                        trailing: Text("2/2"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.hourglass_bottom, color: Colors.orange),
                        title: Text("Status"),
                        trailing: Text("Pending Verification"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.schedule, color: Colors.purple),
                        title: Text("Est. verification time"),
                        trailing: Text("12 hours"),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>  SubmissionHistoryScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Track Submission Status"),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // back to Dashboard
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Go to Dashboard"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
