import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_player/AppVariables/AppColor.dart';
import 'package:flutter_neumorphism_player/Widgets/NeumophismContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolBar extends StatelessWidget {
  double height;
  IconData icon;
  String title;
  Function function;

  ToolBar(
      {this.height = 100,
      this.icon = Icons.search_sharp,
      this.title = "Music Player",@required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 32.w),
            child: NeumorPhismContainer(
              width: 130.w,
              height: 130.h,
              backgroundColor: AppColor.NavigateButton,
              backgroundDarkerColor: AppColor.Background,
              child: ClipOval(
                  child: Image.asset("assets/images/music_image.jpg")),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 70.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Hero(
            tag: 'localSearchIcon',
            child: Container(
              margin: EdgeInsets.only(right: 32.w),
              child: NeumorPhismContainer(
                width: 130.w,
                height: 130.h,
                backgroundColor: AppColor.NavigateButton,
                backgroundDarkerColor: AppColor.Background,
                child: IconButton(
                  onPressed: function,
                  icon: Icon(Icons.search_sharp,
                      size: 50.sp, color: Colors.grey[500]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
