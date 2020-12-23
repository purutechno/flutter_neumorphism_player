import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_player/AppVariables/AppColor.dart';
import 'package:flutter_neumorphism_player/Models/songModel.dart';
import 'package:flutter_neumorphism_player/Services/navigationServices.dart';
import 'package:flutter_neumorphism_player/Services/routes.dart';
import 'package:flutter_neumorphism_player/Widgets/NeumophismContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosenSongWidget extends StatefulWidget {
  final Function onPressPlay;
  final Function onPressFavouraite;
  final SongModel song;

  const ChoosenSongWidget(
      {Key key, this.song, this.onPressPlay, this.onPressFavouraite})
      : super(key: key);

  @override
  _ChoosenSongWidgetState createState() => _ChoosenSongWidgetState();
}

class _ChoosenSongWidgetState extends State<ChoosenSongWidget> {
  bool isPlaying = true;
  bool isFavouraite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 55.h,left: 190.w),
          child: GestureDetector(
            onTap: () {
              widget.onPressFavouraite(widget.song);
            },
            child: NeumorPhismContainer(
              width: 120.w,
              height: 120.h,
              backgroundColor: AppColor.NavigateButton,
              backgroundDarkerColor: AppColor.Background,
              child: Icon(
                Icons.favorite,
                size: ScreenUtil().setSp(50),
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onPressPlay(widget.song);
            navigatorKey.currentState
                .pushNamed(Routes.SongDetail, arguments: {'song': widget.song});
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setSp(15),
                vertical: ScreenUtil().setSp(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppColor.NavigateButton,
              boxShadow: [
                BoxShadow(
                    color: AppColor.Darker,
                    offset: Offset(0.5, 0.5),
                    blurRadius: 1,
                    spreadRadius: 0.5),
                BoxShadow(
                    color: AppColor.Brighter,
                    offset: Offset(-0.5, -0.5),
                    blurRadius: 1,
                    spreadRadius: 0.5),
              ],
            ),
            child: ListTile(
              title: Text(
                widget.song.name,
                style: TextStyle(color: Colors.grey[500], fontSize: 20),
              ),
              subtitle: Text(widget.song.singer,
                  style: TextStyle(color: Colors.grey[700], fontSize: 15)),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                child: Hero(
                  tag: 'playButtonHero',
                  child: NeumorPhismContainer(
                    width: 120.w,
                    height: 120.h,
                    backgroundColor: AppColor.PauseButton,
                    backgroundDarkerColor: AppColor.PauseButtonDarker,
                    borderColor: AppColor.PauseButton,
                    borderDarkerColor: AppColor.PauseButton,
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: ScreenUtil().setSp(40),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
