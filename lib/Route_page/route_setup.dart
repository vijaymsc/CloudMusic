import 'package:cloud_music/Route_page/route_constant.dart';
import 'package:cloud_music/provider/firebase_provider.dart';
import 'package:flutter/material.dart';

import '../UI/login_register/login_view.dart';
import '../UI/login_register/register_view.dart';
import '../main.dart';

abstract class RouterViews {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case RoutePaths.loginUser:
          return MaterialPageRoute(builder: (_) => const LoginUser());

        case RoutePaths.register:
          return MaterialPageRoute(builder: (_) => const RegisterView());

        case RoutePaths.homeScreen:
          return MaterialPageRoute(builder: (_)=>const HomeScreen());

        default:
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                      child: Text('No route defined for ${settings.name}'),
                    ),
                  ));
      }
    } catch (e) {
      showLog(e.toString());
    }
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
  }
}
