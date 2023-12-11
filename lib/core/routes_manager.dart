import 'package:flutter/material.dart';
import 'package:graduation_project/core/string_manager.dart';

import '../home/presentation/screens/home_view.dart';
import '../home/presentation/screens/market_view.dart';

class Routes {
  static const String home = '/';
  static const String market = '/market';
}

class RouteGenerator {
  static Route getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.market:
        return MaterialPageRoute(
          builder: (_) => const MarketView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppString.noRouteFound),
          ),
          body: const Center(child: Text(AppString.noRouteFound)),
        );
      },
    );
  }
}
