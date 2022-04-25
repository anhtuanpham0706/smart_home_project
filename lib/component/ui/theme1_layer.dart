



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter2/component/ui/text_custom.dart';

class Theme3Layer extends StatelessWidget {
  final int index;
  const Theme3Layer(this.index, {Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) => Column(mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, children: [
        Image.asset('assets/images/theme3/ic_fruit$index.jpg', width: 0.8.sw, fit: BoxFit.fitWidth),
        SizedBox(height: 72.sp),
        TextCustom('', size: 24.sp,
            color: const Color(0xFF4D3E09), fontFamily: 'Segoe UI', weight: FontWeight.bold),
        Padding(padding: EdgeInsets.fromLTRB(36.sp, 22.sp, 36.sp, 26.sp), child:
        TextCustom('', size: 18.sp,
            color: const Color(0xFF414141), fontFamily: 'Segoe UI')),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _Point(index == 1),
          _Point(index == 2),
          _Point(index == 3)
        ])
      ]);
}

class _Point extends StatelessWidget {
  final bool active;
  const _Point(this.active);
  @override
  Widget build(BuildContext context) => Container(width: 10.sp, height: 10.sp, decoration: BoxDecoration(
      color: active ? const Color(0xFFB0B0B0) : const Color(0xFFDEDEDE),
      borderRadius: BorderRadius.circular(10.sp)
  ), margin: EdgeInsets.only(left: 5.sp, right: 5.sp));
}