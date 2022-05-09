import 'package:blindside/core/constants/assets.dart';
import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:blindside/core/managers/toast_manager.dart';
import 'package:blindside/features/discover/data/models/comment_model.dart';
import 'package:blindside/features/discover/presentation/widgets/app_circle_avatar.dart';
import 'package:blindside/features/discover/presentation/widgets/comment_widget.dart';
import 'package:blindside/features/discover/presentation/widgets/video_card_widget.dart';
import 'package:blindside/main.dart';
import 'package:blindside/route/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPageArguments {
  final bool isFromUsersProfile;
  final String videoLink;

  VideoDetailPageArguments(
      {required this.isFromUsersProfile, required this.videoLink});

  //copyWith() is used to create a new instance of the class
  VideoDetailPageArguments copyWith({
    bool? isFromUsersProfile,
    String? videoLink,
  }) {
    return VideoDetailPageArguments(
      isFromUsersProfile: isFromUsersProfile ?? this.isFromUsersProfile,
      videoLink: videoLink ?? this.videoLink,
    );
  }
}

class VideoDetailPage extends StatefulWidget {
  const VideoDetailPage({Key? key, required this.args}) : super(key: key);
  final VideoDetailPageArguments args;

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  VideoPlayerController? _controller;
  bool _isMuted = false;
  bool _isCommentExpanded = true;
  bool _isCommentOn = true;
  final List<String> _tagsList = ['#tackle', '#attack', '#defense'];
  final _commentController = TextEditingController();
  final List<CommentModel> _commentList = [];
  String url = '';

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
  void initState() {
    super.initState();
    url = widget.args.videoLink;
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    widget.args.isFromUsersProfile == true
        ? _isCommentExpanded = false
        : _isCommentExpanded = true;
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => CustomNavigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.offWhite,
                      size: 24,
                    ),
                  ),
                  XBox(15.dy),
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      AppCircleAvatar(
                        asset: maleUser,
                        radius: 20,
                      ),
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.check_circle,
                            color: AppColors.blueColor,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  XBox(15.dx),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nacho Fernandez',
                        style: AppStyles.whiteHdStyle(FontWeight.w700),
                      ),
                      Text(
                        'Basketball Exercise Instructor',
                        style: AppStyles.whiteSubHdStyle,
                      ),
                    ],
                  ),
                ],
              ),
              YBox(30.dy),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.appGreyColor),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                    ),
                    VideoProgressIndicator(_controller!,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          backgroundColor: AppColors.splashBgColor,
                          playedColor: AppColors.offWhite,
                          bufferedColor: AppColors.scaffoldBgColor,
                        )),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_controller!.value.isPlaying) {
                              _controller!.pause();
                            } else {
                              _controller!.play();
                            }

                            setState(() {});
                          },
                          icon: Icon(
                            _controller!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: AppColors.offWhite,
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: _controller!,
                          builder: (context, VideoPlayerValue value, child) {
                            return Text(
                              '${value.position.inMinutes}:${value.position.inSeconds}/${_controller!.value.duration.toString().split('.').first}',
                              style: AppStyles.whiteSubHdStyle
                                  .copyWith(fontSize: 14.sp),
                            );
                          },
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            if (_isMuted == true) {
                              _controller!.setVolume(0.0);
                            } else {
                              _controller!.setVolume(1.0);
                            }

                            setState(() {
                              _isMuted = !_isMuted;
                            });
                          },
                          icon: Icon(
                            _isMuted
                                ? Icons.volume_mute_rounded
                                : Icons.volume_up_rounded,
                            color: AppColors.offWhite,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              YBox(40.dy),
              Text(
                '1v1 tactics - opposition defense take on home attack',
                style: AppStyles.whiteHdStyle(FontWeight.w700),
              ),
              YBox(20.dy),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '125,408 views  .',
                    style: AppStyles.whiteSubHdStyle,
                  ),
                  Text(
                    '  2 days ago',
                    style: AppStyles.whiteSubHdStyle,
                  ),
                  XBox(10.dx),
                  ...List.generate(
                    _tagsList.length,
                    (index) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _tagsList[index],
                          style: AppStyles.whiteSubHdStyle.copyWith(
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.w700),
                        ),
                        XBox(10.dx),
                      ],
                    ),
                  ),
                ],
              ),
              YBox(20.dy),
              Divider(
                color: AppColors.offWhite,
              ),
              widget.args.isFromUsersProfile == false
                  ? YBox(20.dy)
                  : const SizedBox.shrink(),
              widget.args.isFromUsersProfile == false
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Toggle Comment',
                          style: AppStyles.whiteSubHdStyle,
                        ),
                        const Spacer(),
                        Switch(
                          value: _isCommentOn,
                          onChanged: (_) {
                            _isCommentOn = _;
                            setState(() {});
                          },
                          activeColor: AppColors.buttonColor,
                        )
                      ],
                    ),
              widget.args.isFromUsersProfile == false
                  ? const SizedBox.shrink()
                  : Divider(
                      color: AppColors.offWhite,
                    ),
              widget.args.isFromUsersProfile == false
                  ? YBox(20.dy)
                  : const SizedBox.shrink(),
              !_isCommentOn
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Comments',
                          style: AppStyles.whiteHdStyle(FontWeight.w600),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            _isCommentExpanded = !_isCommentExpanded;
                            setState(() {});
                          },
                          child: _isCommentExpanded == true
                              ? RotatedBox(
                                  quarterTurns: 2,
                                  child: Image.asset(
                                    expandImg,
                                    scale: 3.2,
                                  ),
                                )
                              : Image.asset(
                                  expandImg,
                                  scale: 3.2,
                                ),
                        )
                      ],
                    ),
              YBox(20.dy),
              !_isCommentOn
                  ? const SizedBox.shrink()
                  : _commentList.isEmpty
                      ? Center(
                          child: Text(
                            'No comments yet, add a comment',
                            style: AppStyles.whiteSubHdStyle,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(
                              _isCommentExpanded == true
                                  ? _commentList.length
                                  : _commentList.take(1).length,
                              (index) => Column(
                                children: [
                                  CommentWidget(
                                    email: _commentList[index].fullname,
                                    comment: _commentList[index].comment,
                                    createdAtl: _commentList[index].createdAt,
                                  ),
                                  YBox(20.dy),
                                ],
                              ),
                            )
                          ],
                        ),
              _isCommentExpanded == true || !_isCommentOn
                  ? const SizedBox.shrink()
                  : YBox(20.dy),
              _isCommentExpanded == true || !_isCommentOn
                  ? const SizedBox.shrink()
                  : Divider(
                      color: AppColors.offWhite,
                    ),
              _isCommentExpanded == true ? YBox(40.dy) : YBox(20.dy),
              _isCommentExpanded == true
                  ? const SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Related Videos',
                          style: AppStyles.whiteHdStyle(FontWeight.w600),
                        ),
                        YBox(20.dy),
                        ...List.generate(
                          _footballList.length,
                          (index) => Column(
                            children: [
                              VideoCardWidget(
                                  heading: _footballList[index]['header']!,
                                  subHeading: _footballList[index]
                                      ['subheading']!,
                                  asset: _footballList[index]['asset']!,
                                  playerName: _footballList[index]
                                      ['playerName']!,
                                  isFootball: true,
                                  isFromRelatedVideos: true,
                                  videoLink: ''),
                              YBox(20.dx)
                            ],
                          ),
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: !_isCommentExpanded || !_isCommentOn
          ? const SizedBox.shrink()
          : Container(
              height: 45.dy,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.appGreyColor.withOpacity(0.3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    moreCircle,
                    scale: 3.2,
                    color: AppColors.offWhite,
                  ),
                  XBox(10.dx),
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      style: AppStyles.whiteSubHdStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Add your comment',
                        hintStyle: AppStyles.whiteSubHdStyle,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (_commentController.text.isEmpty) {
                        ToastManager.errorToast(context,
                            message: 'Comment cannot be empty');
                      } else {
                        CommentModel comment = CommentModel(
                            comment: _commentController.text.trim(),
                            fullname: appUser!.email!,
                            createdAt:
                                DateFormat('hh:mm a').format(DateTime.now()));
                        _commentList.add(comment);
                        _commentController.clear();
                        setState(() {});
                      }
                    },
                    child: Image.asset(
                      sendComment,
                      scale: 3.2,
                    ),
                  )
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
