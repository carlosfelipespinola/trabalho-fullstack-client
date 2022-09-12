import 'package:client/views/home/home_view.dart';
import 'package:client/views/login/login_view.dart';
import 'package:client/views/register/register_view.dart';
import 'package:flutter/material.dart';

class _RoutesNames {
  final login = '';
  final home = 'home';
  final register = 'register';
}

class NavigationHelper {
  static final routes = _RoutesNames();

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    if ( settings.name == routes.login ) {
      return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => const LoginView()
      );
    }
    if ( settings.name == routes.home ) {
      return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => const HomeView()
      );
    }
    if ( settings.name == routes.register ) {
      return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => const RegisterView()
      );
    }
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => const Text('Not found')
      );
  }
}



