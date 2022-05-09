// ignore_for_file: must_be_immutable

import 'package:blindside/core/constants/assets.dart';
import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:blindside/features/discover/presentation/pages/video_detail_page.dart';
import 'package:blindside/features/discover/presentation/widgets/app_circle_avatar.dart';
import 'package:blindside/route/custom_navigator.dart';
import 'package:blindside/route/route.dart';
import 'package:flutter/material.dart';

class VideoCardWidget extends StatelessWidget {
  const VideoCardWidget({
    Key? key,
    required this.asset,
    required this.heading,
    required this.subHeading,
    required this.playerName,
    this.isFootball = true,
    this.isFromRelatedVideos = false,
    this.isFromUsersProfile = false,
    required this.videoLink,
  }) : super(key: key);
  final String asset;
  final String heading;
  final String subHeading;
  final String playerName;
  final bool isFootball;
  final String videoLink;
  final bool isFromRelatedVideos;
  final bool isFromUsersProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final args = VideoDetailPageArguments(
          isFromUsersProfile: isFromUsersProfile,
          videoLink: videoLink,
        );
        CustomNavigator.pushTo(
          context,
          videoDetailPage,
          arguments: args,
        );
      },
      child: Container(
        height: 220.dy,
        width: isFromRelatedVideos == true ? double.maxFinite : 250.dx,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(asset),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 110.dy,
              width: isFromRelatedVideos == true ? double.maxFinite : 250.dx,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                color: AppColors.cardBgColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading.toUpperCase(),
                    style: AppStyles.whiteHdStyle(FontWeight.w600).copyWith(
                        fontSize: 14.sp, color: AppColors.buttonColor),
                  ),
                  Text(
                    subHeading,
                    overflow: TextOverflow.fade,
                    style: AppStyles.whiteHdStyle(FontWeight.w600).copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  YBox(5.dy),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppCircleAvatar(
                        asset: maleUser,
                      ),
                      XBox(7.dx),
                      Text(
                        playerName,
                        style: AppStyles.whiteHdStyle(FontWeight.w600).copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      const Spacer(),
                      !isFootball
                          ? Image.asset(
                              basketball,
                              scale: 3.2,
                            )
                          : Image.asset(
                              soccer,
                              scale: 3.2,
                            ),
                      !isFootball ? const SizedBox.shrink() : XBox(5.dx),
                      !isFootball
                          ? const SizedBox.shrink()
                          : Image.asset(
                              americanFootball,
                              scale: 3.2,
                            )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
