import 'package:flutter/material.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/config/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teji Mandi V2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.kLandingPageRoute,
    );
  }
}
