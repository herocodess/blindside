import 'package:blindside/core/managers/shared_preference_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blindside/dependency_injection.dart' as injection;

class AppManager {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
    await injection.init();
    await SharedPreferencesManager.init();
  }
}
