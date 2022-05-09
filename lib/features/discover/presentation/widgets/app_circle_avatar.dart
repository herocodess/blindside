import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({Key? key, required this.asset, this.radius = 12})
      : super(key: key);
  final String asset;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(asset),
    );
  }
}
