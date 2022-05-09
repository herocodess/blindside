import 'package:flutter/material.dart';

class CustomNavigator {
  static pushTo(BuildContext context, String strPageName,
      {var arguments}) async {
    var result = await Navigator.of(context, rootNavigator: true)
        .pushNamed(strPageName, arguments: arguments);
    return result;
  }

  static pop(BuildContext context, {var result}) {
    Navigator.pop(context, result);
  }

  static popTo(BuildContext context, String strPageName) {
    Navigator.popAndPushNamed(context, strPageName);
  }

  static pushReplace(BuildContext context, String strPageName,
      {var arguments}) {
    Navigator.pushReplacementNamed(context, strPageName, arguments: arguments);
  }

  static popAndPushReplace(BuildContext context, strPageName, {var arguments}) {
    Navigator.pushNamedAndRemoveUntil(context, strPageName, (route) => false,
        arguments: arguments);
  }
}
