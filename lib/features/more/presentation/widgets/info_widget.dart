import 'package:blindside/core/constants/style_constants.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key, required this.text, required this.number})
      : super(key: key);
  final String text;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: AppStyles.whiteHdStyle(FontWeight.w600),
        ),
        Text(
          text,
          style: AppStyles.whiteSubHdStyle,
        ),
      ],
    );
  }
}
