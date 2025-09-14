import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../deposit/deposit.dart';

class NewUserDashboard extends StatelessWidget {
  const NewUserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset('assets/code2earn_logo.png', fit: BoxFit.contain),
        // ),
        backgroundColor: Colors.white,
        title: SvgPicture.asset('assets/icons/code2earn_logo.svg',height: 50,),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(child: Icon(Icons.person, color: Colors.white), backgroundColor: Colors.grey[800]),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Align(alignment:Alignment.centerLeft,child: Text("Welcome, Rohan!",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
            SizedBox(height: 14,),
            _depositBanner(context),
            SizedBox(height: 14),

            // Deposit CTA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    "Start Your First Challenge 🚀",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     foregroundColor: Colors.orange,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: const Text("Deposit & Start"),
                  // ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // How it Works
            const Text(
              "How It Works",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _StepCard(
                  icon: Icons.account_balance_wallet,
                  title: "Step 1",
                  subtitle: "Deposit & set challenge",
                ),
                _StepCard(
                  icon: Icons.code,
                  title: "Step 2",
                  subtitle: "Solve & upload proof",
                ),
                _StepCard(
                  icon: Icons.monetization_on,
                  title: "Step 3",
                  subtitle: "Earn refund daily",
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Testimonials
            const Text(
              "What People Say",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: PageView(
                children: const [
                  _FeedbackCard(
                    feedback:
                    "Code2Earn helped me stay consistent with DSA!",
                    user: "Rohit, 3rd Year CSE",
                  ),
                  _FeedbackCard(
                    feedback: "Earning while learning boosted my motivation.",
                    user: "Anjali, Job Prep",
                  ),
                  _FeedbackCard(
                    feedback: "Daily streaks keep me accountable.",
                    user: "Arjun, Developer",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Leaderboard Sneak Peek
            const Text(
              "Leaderboard (Top 3)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: const [
                _LeaderboardTile(rank: 1, name: "Rahul", points: 120),
                _LeaderboardTile(rank: 2, name: "Simran", points: 115),
                _LeaderboardTile(rank: 3, name: "Karan", points: 110),
              ],
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text("Join to see more →"),
            ),
          ],
        ),
      ),
    );
  }
  Widget _depositBanner(BuildContext ctx) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFDF4E9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade50),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Ready to build a daily DSA habit?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text('Deposit to start a commitment — complete challenges to earn back your money.', style: TextStyle(color: Colors.black54)),
            ]),
          ),
          SizedBox(width: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF8A00), padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            onPressed: (){
              Navigator.push(ctx, new MaterialPageRoute(builder: (context)=>ChallengeSetupScreen()));
            },
            child: Text('Deposit Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

}

class _StepCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _StepCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.orange.shade100,
          child: Icon(icon, color: Colors.orange, size: 28),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          width: 90,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  final String feedback;
  final String user;

  const _FeedbackCard({
    required this.feedback,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              feedback,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              "- $user",
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeaderboardTile extends StatelessWidget {
  final int rank;
  final String name;
  final int points;

  const _LeaderboardTile({
    required this.rank,
    required this.name,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.orange.shade100,
        child: Text(
          "$rank",
          style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(name),
      trailing: Text(
        "$points pts",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
