

import 'package:code2earn/screens/dashboard/dash_board.dart';
import 'package:flutter/material.dart';

import '../dashboard/new_dash_board.dart';
import 'auth_screen.dart';


/*
* Landing page:
* This Page is responsible auth state.
*
*
*
* */
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_getBody(),
    );
  }
  Widget _getBody() {
    return  DashboardPage();
  }

  /*Widget _getBody() {
    return  StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const DashBoard();
        } else {
          return const AuthScreen();
        }
      },
    );
  }*/
}
