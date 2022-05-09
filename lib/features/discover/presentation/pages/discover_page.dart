import 'package:blindside/core/constants/assets.dart';
import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/string_constants.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:blindside/features/discover/presentation/widgets/video_card_widget.dart';
import 'package:blindside/features/discover/presentation/widgets/video_header_widget.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
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

  final List<Map<String, String>> _basketBallList = [
    {
      'header': 'Exercise',
      'subheading': 'Charging one arm',
      'asset': basketball1,
      'playerName': 'Kevin Durant'
    },
    {
      'header': 'Exercise',
      'subheading': '1v1 - opposition defense take on home attack',
      'asset': basketball2,
      'playerName': 'Lebron James'
    },
    {
      'header': 'Exercise',
      'subheading': 'Shooting all 3-pointers',
      'asset': basketball3,
      'playerName': 'Steph Curry'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YBox(50.dy),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: AppStyles.whiteHdStyle(FontWeight.bold)
                          .copyWith(fontSize: 34),
                    ),
                    YBox(5.dy),
                    Text(
                      'Explore different contents from creators',
                      style: AppStyles.whiteSubHdStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.search_outlined,
                  size: 28,
                  color: AppColors.offWhite,
                )
              ],
            ),
            YBox(40.dy),
            VideoHeaderWidget(
              category: 'Football',
              onTap: () {},
            ),
            YBox(20.dy),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                    _footballList.length,
                    (index) => Row(
                      children: [
                        VideoCardWidget(
                          heading: _footballList[index]['header']!,
                          subHeading: _footballList[index]['subheading']!,
                          asset: _footballList[index]['asset']!,
                          playerName: _footballList[index]['playerName']!,
                          isFootball: true,
                          videoLink: AppStrings.footballVideos[index],
                        ),
                        XBox(10.dx)
                      ],
                    ),
                  )
                ],
              ),
            ),
            YBox(40.dy),
            VideoHeaderWidget(
              category: 'Basketball',
              onTap: () {},
            ),
            YBox(20.dy),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                    _basketBallList.length,
                    (index) => Row(
                      children: [
                        VideoCardWidget(
                          heading: _basketBallList[index]['header']!,
                          subHeading: _basketBallList[index]['subheading']!,
                          asset: _basketBallList[index]['asset']!,
                          playerName: _basketBallList[index]['playerName']!,
                          isFootball: false,
                          videoLink: AppStrings.basketballVideos[index],
                        ),
                        XBox(10.dx)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
