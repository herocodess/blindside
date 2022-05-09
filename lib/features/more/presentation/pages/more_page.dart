import 'package:blindside/core/constants/assets.dart';
import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/string_constants.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:blindside/features/discover/presentation/widgets/app_circle_avatar.dart';
import 'package:blindside/features/discover/presentation/widgets/video_card_widget.dart';
import 'package:blindside/features/more/presentation/widgets/info_widget.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final List<Map<String, String>> _footballList = [
    {
      'header': 'Exercise',
      'subheading': 'Foot Cordination and catching the ball',
      'asset': football,
      'playerName': 'Kareem Benzema'
    },
    {
      'header': 'Exercise',
      'subheading': 'Tackling and passing the ball in exactly 3 seconds',
      'asset': football2,
      'playerName': 'Toney Krus'
    },
    {
      'header': 'Exercise',
      'subheading': 'Curving the ball 300m long',
      'asset': football3,
      'playerName': 'Looka Mudric'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: <Widget>[
              //seperate
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      profileBanner,
                      fit: BoxFit.cover,
                    ),
                    height: 160.dy,
                  ),
                  Positioned(
                    top: 160.dy - 50.dy,
                    child: AppCircleAvatar(
                      asset: profilePhoto,
                      radius: 50,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YBox(70.dy),
                    Center(
                      child: Text(
                        "Nacho Fernandes",
                        style: AppStyles.whiteHdStyle(FontWeight.w600),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Basketball exercise instructor",
                        style: AppStyles.whiteSubHdStyle,
                      ),
                    ),
                    YBox(40.dy),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Info(
                            number: "200",
                            text: "Videos",
                          ),
                          const Info(
                            number: "1,379",
                            text: "Learners",
                          ),
                          Chip(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: SizedBox(
                              width: 140,
                              height: 36,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Edit Profile",
                                  style: AppStyles.whiteSubHdStyle
                                      .copyWith(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            backgroundColor: const Color(0xff181A1C),
                          )
                        ],
                      ),
                    ),
                    YBox(40.dy),
                    ...List.generate(
                      _footballList.length,
                      (index) => Column(
                        children: [
                          VideoCardWidget(
                            heading: _footballList[index]['header']!,
                            subHeading: _footballList[index]['subheading']!,
                            asset: _footballList[index]['asset']!,
                            playerName: _footballList[index]['playerName']!,
                            isFootball: true,
                            isFromRelatedVideos: true,
                            isFromUsersProfile: true,
                            videoLink: AppStrings.footballVideos[index],
                          ),
                          YBox(20.dx)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
