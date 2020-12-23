import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_player/AppVariables/AppColor.dart';
import 'package:flutter_neumorphism_player/Models/songModel.dart';
import 'package:flutter_neumorphism_player/Widgets/NeumophismContainer.dart';
import 'package:flutter_neumorphism_player/Widgets/SpinningImage.dart';
import 'package:flutter_neumorphism_player/Widgets/music_player_toolbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongDetail extends StatefulWidget {
  final SongModel song;

  const SongDetail({Key key, @required this.song}) : super(key: key);

  @override
  _SongDetailState createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  double sliderValue = 0;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Background,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
              child: Column(
                children: <Widget>[
                  MusicPlayerToolbar(
                    height: 150.h,
                    backButtonPressedfunction: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  Hero(
                    tag: 'imageHero',
                    child: SpinningImage(
                      height: 750.h,
                    ),
                  ),
                  SizedBox(
                    height: 180.h,
                  ),
                  Text(
                    widget.song.name,
                    style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    widget.song.singer,
                    style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '0:00',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 35.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '12:00',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: ScreenUtil().setSp(35)),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: Colors.grey,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: ScreenUtil().setSp(30))),
                    child: Slider(
                      activeColor: AppColor.NavigateButton,
                      inactiveColor: AppColor.Brighter,
                      value: sliderValue,
                      onChanged: (newValue) {
                        setState(() {
                          sliderValue = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      NeumorPhismContainer(
                        width: 200.w,
                        height: 200.h,
                        backgroundColor: AppColor.NavigateButton,
                        backgroundDarkerColor: AppColor.Brighter,
                        borderColor: AppColor.NavigateButton,
                        borderDarkerColor: AppColor.NavigateButton,
                        child: Icon(
                          Icons.skip_previous,
                          size: 70.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        child: Hero(
                          tag: 'playButtonHero',
                          child: NeumorPhismContainer(
                            width: 200.w,
                            height: 200.h,
                            backgroundColor: AppColor.PauseButton,
                            backgroundDarkerColor: AppColor.PauseButtonDarker,
                            borderColor: AppColor.PauseButton,
                            borderDarkerColor: AppColor.PauseButton,
                            child: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              size: 70.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      NeumorPhismContainer(
                        width: 200.w,
                        height: 200.h,
                        backgroundColor: AppColor.NavigateButton,
                        backgroundDarkerColor: AppColor.Brighter,
                        borderColor: AppColor.NavigateButton,
                        borderDarkerColor: AppColor.NavigateButton,
                        child: Icon(
                          Icons.skip_next,
                          size: 70.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
