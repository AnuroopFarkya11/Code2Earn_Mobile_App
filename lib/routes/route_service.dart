
import 'package:code2earn/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../screens/auth/mainpage.dart';

class RouteService{

  static Map<String,WidgetBuilder> routes = {
    RoutePath.root: (context) => const LandingPage(),

  };



}