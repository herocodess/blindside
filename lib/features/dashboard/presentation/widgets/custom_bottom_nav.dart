import 'package:blindside/core/constants/assets.dart';
import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Menu {
  discover,
  browse,
  saved,
  more,
}

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    Key? key,
    required this.selectedMenu,
    required this.onChanged,
  }) : super(key: key);
  final Menu selectedMenu;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    //for when the menu option is not clicked
    var inActiveIconColor = AppColors.offWhite;
    return Container(
      height: 110.dy,
      padding: const EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: AppColors.appGreyColor.withOpacity(0.3),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //discover options
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      discover,
                      color: Menu.discover == selectedMenu
                          ? AppColors.buttonColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => onChanged(0),
                  ),
                  Text(
                    'Discover',
                    style: AppStyles.whiteSubHdStyle.copyWith(
                      color: Menu.discover == selectedMenu
                          ? AppColors.buttonColor
                          : inActiveIconColor,
                    ),
                  ),
                ],
              ),
            ),

            //browse option
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      browse,
                      color: Menu.browse == selectedMenu
                          ? AppColors.buttonColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => onChanged(1),
                  ),
                  Text(
                    'Browse',
                    style: AppStyles.whiteSubHdStyle.copyWith(
                      color: Menu.browse == selectedMenu
                          ? AppColors.buttonColor
                          : inActiveIconColor,
                    ),
                  ),
                ],
              ),
            ),
            //saved option
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      saved,
                      color: Menu.saved == selectedMenu
                          ? AppColors.buttonColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => onChanged(2),
                  ),
                  Text(
                    'Saved',
                    style: AppStyles.whiteSubHdStyle.copyWith(
                      color: Menu.saved == selectedMenu
                          ? AppColors.buttonColor
                          : inActiveIconColor,
                    ),
                  ),
                ],
              ),
            ),
            //more option
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      more,
                      color: Menu.more == selectedMenu
                          ? AppColors.buttonColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => onChanged(3),
                  ),
                  Text(
                    'More',
                    style: AppStyles.whiteSubHdStyle.copyWith(
                      color: Menu.more == selectedMenu
                          ? AppColors.buttonColor
                          : inActiveIconColor,
                    ),
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
