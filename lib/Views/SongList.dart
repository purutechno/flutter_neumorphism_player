import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_player/AppVariables/AppColor.dart';
import 'package:flutter_neumorphism_player/AppVariables/AppData.dart';
import 'package:flutter_neumorphism_player/Models/songModel.dart';
import 'package:flutter_neumorphism_player/Widgets/ChoosenSongWidget.dart';
import 'package:flutter_neumorphism_player/Widgets/NeumophismContainer.dart';
import 'package:flutter_neumorphism_player/Widgets/SongWidget.dart';
import 'package:flutter_neumorphism_player/Widgets/SpinningImage.dart';
import 'package:flutter_neumorphism_player/Widgets/toolbarContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  double sliderValue = 0;
  String playingSong;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);
    return Scaffold(
      backgroundColor: AppColor.Background,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Column(
              children: <Widget>[
                ToolBar(
                  height: 150.h,
                  function: () {

                  },
                ),
                SizedBox(
                  height: 90.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Hero(
                        tag: 'imageHero',
                        child: SpinningImage(
                          height: 400.h,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 90.h),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                    child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (songs[index].id == playingSong) {
                          return ChoosenSongWidget(
                            onPressPlay: (SongModel song) {
                              setState(() {
                                playingSong = song.id;
                              });
                            },
                            song: songs[index],
                          );
                        } else {
                          return SongWidget(
                            song: songs[index],
                            onPressPlay: (SongModel song) {
                              setState(() {
                                playingSong = song.id;
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
