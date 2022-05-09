import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/string_constants.dart';
import 'package:blindside/core/constants/themes.dart';
import 'package:blindside/core/managers/app_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blindside/route/route.dart' as route;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppManager.initialize();
  runApp(const MyApp());
}

User? appUser;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      themeMode:
          ThemeMode.system, // To pick the dark/ligt from the phone settings
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: route.appEntry,
      onGenerateRoute: route.router,
      builder: (context, widget) {
        final media = MediaQuery.of(context);
        Dims.setSize(media);
        return widget!;
      },
    );
  }
}
