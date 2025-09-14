import 'package:code2earn/routes/route_path.dart';
import 'package:code2earn/routes/route_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Code2EarnApp());
}

class Code2EarnApp extends StatefulWidget {
  const Code2EarnApp({super.key});

  @override
  State<Code2EarnApp> createState() => _Code2EarnAppState();
}

class _Code2EarnAppState extends State<Code2EarnApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:
          (context, constraint) => ScreenUtilInit(
            designSize: Size(constraint.maxWidth, constraint.maxHeight),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.light,
                primaryColor: Color(0xFFFF8A00),
                scaffoldBackgroundColor: Colors.white,

                fontFamily: GoogleFonts.libreFranklin().fontFamily,
                textTheme: TextTheme(
                  headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  titleMedium: TextStyle(fontSize: 16, color: Colors.black87),
                  bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xFFFF8A00),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    textStyle: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),


              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.dark,
                fontFamily: GoogleFonts.libreFranklin().fontFamily,
              ),
              themeMode: ThemeMode.system,
              // home: OnboardingScreen(),
              initialRoute: RoutePath.root,
              routes: RouteService.routes,
            ),
          ),
    );
  }
}
//
// import 'package:code2earn/screens/deposit/deposit.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(Code2EarnApp());
// }
//
// class Code2EarnApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Code2Earn',
//       theme: ThemeData(
//         primaryColor: Color(0xFFFF8A00),
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'Inter',
//         appBarTheme: AppBarTheme(
//           elevation: 0,
//           color: Colors.white,
//           iconTheme: IconThemeData(color: Colors.black87),
//           titleTextStyle: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//       ),
//       // home: Deposit(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

