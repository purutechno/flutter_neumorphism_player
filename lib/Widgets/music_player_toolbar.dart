import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_player/AppVariables/AppColor.dart';
import 'package:flutter_neumorphism_player/Widgets/NeumophismContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicPlayerToolbar extends StatelessWidget {
  double height;
  String title;
  Function backButtonPressedfunction;
  MusicPlayerToolbar({this.height = 150,this.title = "PLAYING NOW",@required this.backButtonPressedfunction});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        children: [
          Hero(
            tag: 'leftButtonHero',
            child: GestureDetector(
              onTap: backButtonPressedfunction,
              child: NeumorPhismContainer(
                width: 130.w,
                height: 130.h,
                backgroundColor: AppColor.NavigateButton,
                backgroundDarkerColor: AppColor.Background,
                child: Icon(
                  Icons.arrow_back,
                  size: 50.sp,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Hero(
            tag: 'rightButtonHero',
            child: NeumorPhismContainer(
              width: 130.h,
              height: 130.w,
              backgroundColor: AppColor.NavigateButton,
              backgroundDarkerColor: AppColor.Background,
              child: Icon(
                Icons.menu,
                size: ScreenUtil().setSp(50),
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
