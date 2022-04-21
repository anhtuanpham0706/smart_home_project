import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
      child: Center(child: SizedBox(
          child: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          width: 50.sp, height: 50.sp)),
      color: Colors.transparent, width: 1.sw, height: 1.sh);
}