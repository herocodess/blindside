import 'package:blindside/entry/app_entry.dart';
import 'package:blindside/entry/splash.dart';
import 'package:blindside/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:blindside/features/discover/presentation/pages/video_detail_page.dart';
import 'package:blindside/features/login/presentation/pages/login_page.dart';
import 'package:blindside/features/register/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

const String appEntry = '/';
const String splashPage = '/splash-page';
const String loginPage = '/login-page';
const String registerPage = '/register-page';
const String dashboardPage = '/dashboard-page';
const String videoDetailPage = '/videodetail-page';

Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case appEntry:
      return MaterialPageRoute(builder: (context) => const AppEntryWidget());
    case splashPage:
      return MaterialPageRoute(builder: (context) => const SplashPage());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => const RegisterPage());
    case dashboardPage:
      return MaterialPageRoute(builder: (context) => const DashboardPage());
    case videoDetailPage:
      return MaterialPageRoute(
          builder: (context) => VideoDetailPage(
                args: settings.arguments as VideoDetailPageArguments,
              ));
    default:
      return MaterialPageRoute(builder: (context) => const RouteNotFoundPage());
  }
}

class RouteNotFoundPage extends StatelessWidget {
  const RouteNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No route found '),
      ),
    );
  }
}
