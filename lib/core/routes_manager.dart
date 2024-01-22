import 'package:flutter/material.dart';
import 'package:graduation_project/core/string_manager.dart';
import 'package:graduation_project/home/presentation/screens/settings_view.dart';
import '../home/presentation/screens/home_view.dart';
import '../home/presentation/screens/gold_view.dart';
import '../home/presentation/screens/statis_tics.dart';
import '../login/presentation/screens/forgot_password.dart';
import '../login/presentation/screens/login_screen.dart';
import '../login/presentation/screens/onboarding_Screen.dart';
import '../login/presentation/screens/open_screen.dart';
import '../login/presentation/screens/signup_screen.dart';

class Routes {
  static const String openScreen = '/ ';
  static const String home = '/home ';
  static const String signIn = '/signIn ';
  static const String signUp = '/signUp ';
  static const String forgotPassword = '/forgotPassword ';
  static const String onboarding = '/onboarding ';
  static const String market = '/market';
  static const String statistics = '/statistic';
  static const String settings = '/settings';
}

class RouteGenerator {
  static Route getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.openScreen:
        return MaterialPageRoute(
          builder: (_) => const OpenScreen(),
        );
        case Routes.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
        );
        case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );
        case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );
        case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
        case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.market:
        return MaterialPageRoute(
          builder: (_) => const GoldView(),
        );
      case Routes.statistics:
        return MaterialPageRoute(
          builder: (_) => const StatisticsView(),
        );
        case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingView(),
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
