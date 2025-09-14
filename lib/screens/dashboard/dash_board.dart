import 'package:code2earn/screens/deposit/deposit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'new_dash_board.dart';

class DashboardPage extends StatelessWidget {
  // Mock data
  final int deposit = 500;
  final int eligibleRefund = 150;
  final int completedDays = 3;
  final int totalDays = 10;
  final int streak = 3;

  @override
  Widget build(BuildContext context) {
    double progress = completedDays / totalDays;
    return Scaffold(
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
      endDrawer: _buildDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Align(alignment:Alignment.centerLeft,child: Text("Welcome, Rohan!",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
              // SizedBox(height: 7,),
              // Align(alignment:Alignment.centerLeft,child: Text('Ready to build a daily DSA habit?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
              // SizedBox(height: 15,),
              //
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF8A00), padding: EdgeInsets.symmetric(horizontal: 38, vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              //   onPressed: (){
              //      Navigator.push(context, new MaterialPageRoute(builder: (context)=>ChallengeSetupScreen()));
              //   },
              //   child: Text('Deposit Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15)),
              // ),


              // _depositBanner(context),
              SizedBox(height: 14),
              _activeChallengeCard(context, progress),
              SizedBox(height: 12),
              _progressCard(progress),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _walletCard()),
                  SizedBox(width: 12),
                  Expanded(child: _streakCard()),
                ],
              ),
              SizedBox(height: 12),
              _leaderboardCard(),
              SizedBox(height: 36),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Submit Proof'),
        icon: Icon(Icons.upload_file),
        onPressed: () {
          // Navigate to submission flow (MVP)
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Open submission screen')));
        },
        backgroundColor: Color(0xFFFF8A00),
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
            onPressed: () => _openDeposit(ctx),
            child: Text('Deposit Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _activeChallengeCard(BuildContext context, double progress) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // elevation: 0,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Active Challenge', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          Text('10 Days · ₹500 · 2/day', style: TextStyle(color: Colors.black54)),
          SizedBox(height: 10),
          LinearProgressIndicator(value: progress, minHeight: 8, backgroundColor: Colors.grey.shade200, valueColor: AlwaysStoppedAnimation(Color(0xFF3CC17D))),
          SizedBox(height: 12),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Start challenge
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Open challenge screen')));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF8A00), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                child: Text('Start Today',style: TextStyle(color: Colors.white),),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Widget _progressCard(double progress) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Progress', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          Text('3 of 10 completed', style: TextStyle(fontSize: 14, color: Colors.black87)),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation(Color(0xFF3CC17D)),
          ),
          SizedBox(height: 8),
          TextButton(onPressed: () {}, child: Text('View Rules'))
        ]),
      ),
    );
  }

  Widget _walletCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Wallet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Total Deposit', style: TextStyle(color: Colors.black54)),
          Text('₹ $deposit', style: TextStyle(fontWeight: FontWeight.w600)),
        ]),
        SizedBox(height: 6),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Eligible Refund', style: TextStyle(color: Colors.black54)),
          Text('₹ $eligibleRefund', style: TextStyle(fontWeight: FontWeight.w600)),
        ]),
        SizedBox(height: 12),
        ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF8A00), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: Text('Withdraw'))
      ])),
    );
  }

  Widget _streakCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Streak', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        SizedBox(height: 12),
        Row(children: [
          Icon(Icons.local_fire_department, color: Colors.orange),
          SizedBox(width: 8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('$streak-day streak', style: TextStyle(fontWeight: FontWeight.w600)),
            Text('Keep it up!', style: TextStyle(color: Colors.black54, fontSize: 12)),
            Text('Keep it up!', style: TextStyle(color: Colors.black54, fontSize: 12)),
            Text('Keep it up!', style: TextStyle(color: Colors.black54, fontSize: 12)),
            Text('Keep it up!', style: TextStyle(color: Colors.black54, fontSize: 12)),
            Text('Keep it up!', style: TextStyle(color: Colors.black54, fontSize: 12)),
          ])
        ])
      ])),
    );
  }

  Widget _leaderboardCard() {
    // Mock leaderboard
    final entries = [
      {'name': 'Rohan', 'score': 3},
      {'name': 'Sneha', 'score': 2},
      {'name': 'Abhinav', 'score': 2},
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Leaderboard', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        SizedBox(height: 12),
        ...entries.map((e) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              CircleAvatar(child: Text("Anuroop"), backgroundColor: Colors.grey.shade200),
              SizedBox(width: 10),
              Text("Anuroop!", style: TextStyle(fontWeight: FontWeight.w600)),
            ]),
            Text('${e['score']}', style: TextStyle(fontWeight: FontWeight.w700))
          ]),
        )).toList()
      ])),
    );
  }

  Drawer _buildDrawer(BuildContext ctx) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(child: Row(children: [
              Image.asset('assets/code2earn_logo.png', width: 48, height: 48),
              SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Code2Earn', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Daily DSA Habit', style: TextStyle(fontSize: 12, color: Colors.black54)),
              ])
            ])),
            ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: () => Navigator.pop(ctx)),
            ListTile(leading: Icon(Icons.task), title: Text('Challenges'), onTap: () {}),
            ListTile(leading: Icon(Icons.account_balance_wallet), title: Text('Wallet'), onTap: () {}),
            ListTile(leading: Icon(Icons.history), title: Text('History'), onTap: () {}),
            ListTile(leading: Icon(Icons.emoji_events), title: Text('Leaderboard'), onTap: () {}),
            Spacer(),
            ListTile(leading: Icon(Icons.help_outline), title: Text('Help'), onTap: () {}),
          ],
        ),
      ),
    );
  }

  void _openDeposit(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.all(16),
        height: 260,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Deposit Amount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 12),
          Wrap(spacing: 10, children: [
            ChoiceChip(label: Text('₹500'), selected: true, onSelected: (_) {}),
            ChoiceChip(label: Text('₹1000'), selected: false, onSelected: (_) {}),
            ChoiceChip(label: Text('₹2000'), selected: false, onSelected: (_) {}),
          ]),
          Spacer(),
          ElevatedButton(onPressed: () {}, child: Center(child: Text('Proceed to Payment')), style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF8A00), minimumSize: Size.fromHeight(48))),
        ]),
      ),
    );
  }
}
