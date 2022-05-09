import 'package:blindside/core/constants/assets.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:blindside/features/discover/presentation/widgets/app_circle_avatar.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
    required this.comment,
    required this.createdAtl,
    required this.email,
  }) : super(key: key);
  final String email;
  final String comment;
  final String createdAtl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCircleAvatar(
          asset: maleUser,
          radius: 20,
        ),
        XBox(10.dx),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$email  .  $createdAtl',
                style: AppStyles.whiteSubHdStyle,
              ),
              YBox(5.dy),
              Text(
                comment,
                style: AppStyles.whiteSubHdStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
      ],
    );
  }
}
