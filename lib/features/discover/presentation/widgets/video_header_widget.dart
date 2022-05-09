import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:flutter/material.dart';

class VideoHeaderWidget extends StatelessWidget {
  const VideoHeaderWidget({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);
  final String category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'With Sport - $category',
          style:
              AppStyles.whiteHdStyle(FontWeight.w600).copyWith(fontSize: 15.sp),
        ),
        const Spacer(),
        Text(
          'View all',
          style:
              AppStyles.whiteSubHdStyle.copyWith(color: AppColors.buttonColor),
        )
      ],
    );
  }
}
