import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes_manager.dart';
import 'package:graduation_project/core/them_manager.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.openScreen,
      onGenerateRoute: RouteGenerator.getRoutes,
      theme: getApplicationTheme(),
    );
  }
}
