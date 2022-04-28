
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_custom.dart';
import '../multi_language.dart';
import 'button_custom_transparent.dart';

class LoginWithOthers extends StatelessWidget {
  final Function funFacebook, funGoogle, funApple;
  const LoginWithOthers(this.funFacebook, this.funGoogle, this.funApple, {Key? key}):super(key:key);
  @override
  Widget build(BuildContext context) => Column(children: [
    Padding(padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp), child: Row(children: [
      Expanded(child: Container(height: 1, color: const Color(0xFFE7E7E7), margin: EdgeInsets.only(right: 12.sp))),
      TextCustom(MultiLanguage.get('lbl_or'),//
          size: 14.sp, color: const Color(0xFF8A8787), fontFamily: 'Segoe UI'),
      Expanded(child: Container(height: 1, color: const Color(0xFFE7E7E7), margin: EdgeInsets.only(left: 12.sp))),
    ])),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ButtonCustomTransparent(funFacebook,
          Image.asset('assets/images/theme3/ic_facebook.png', width: 52.sp, height: 52.sp), sizeRadius: 30.sp),
      SizedBox(width: 52.sp),
      ButtonCustomTransparent(funGoogle,
          Image.asset('assets/images/theme3/ic_google.png', width: 52.sp, height: 52.sp), sizeRadius: 30.sp),
      SizedBox(width: 52.sp),
      ButtonCustomTransparent(funApple,
          Image.asset('assets/images/theme3/ic_apple.png', width: 52.sp, height: 52.sp), sizeRadius: 30.sp)
    ])
  ]);
}