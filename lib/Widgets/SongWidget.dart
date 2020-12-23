import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_player/AppVariables/AppColor.dart';
import 'package:flutter_neumorphism_player/Models/songModel.dart';
import 'package:flutter_neumorphism_player/Services/navigationServices.dart';
import 'package:flutter_neumorphism_player/Services/routes.dart';
import 'package:flutter_neumorphism_player/Widgets/NeumophismContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongWidget extends StatelessWidget {
  final Function onPressPlay;
  final Function onPressFavouraite;
  final SongModel song;

  const SongWidget({
    Key key,
    this.song,
    this.onPressPlay,
    this.onPressFavouraite
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 55.h,left: 190.w),
          child: GestureDetector(
            onTap: () {
              onPressFavouraite(song);
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
            onPressPlay(song);
            navigatorKey.currentState
                .pushNamed(Routes.SongDetail, arguments: {'song': song});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
            child: ListTile(
                title: Text(
                  song.name,
                  style: TextStyle(color: Colors.grey[500], fontSize: 60.sp),
                ),
                subtitle: Text(song.singer,
                    style: TextStyle(color: Colors.grey[700], fontSize: 45.sp)),
                trailing: GestureDetector(
                  onTap: () {
                    onPressPlay(song);
                  },
                  child: NeumorPhismContainer(
                    width: 120.w,
                    height: 120.h,
                    backgroundColor: AppColor.NavigateButton,
                    backgroundDarkerColor: AppColor.Brighter,
                    child: Icon(
                      Icons.play_arrow,
                      size: 70.sp,
                      color: Colors.grey[500],
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
