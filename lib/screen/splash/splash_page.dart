

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter2/component/ui/text_custom.dart';
import 'package:project_flutter2/component/ui/theme1_layer.dart';
import 'package:project_flutter2/component/util/util_ui.dart';
import 'package:project_flutter2/screen/main/main_page.dart';
import 'package:project_flutter2/screen/profile/ui/profile_page.dart';
import 'package:project_flutter2/screen/sign_in/login_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _startScroll = false, _lockSkip = true;
  int _page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFFE5E5E5),
        body: Column(children: [
          Expanded(child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5, blurRadius: 9, offset: const Offset(0, 7))],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.sp),
                      bottomRight: Radius.circular(24.sp))),
              child: CarouselSlider.builder(itemCount: 3,
                  itemBuilder: (BuildContext context, int index, int realIndex) => Theme3Layer(index+1),
                  options: CarouselOptions(
                      autoPlay: true, viewportFraction: 1, aspectRatio: 0.8)
              ))),
          Padding(padding: EdgeInsets.only(top: 40.sp, bottom: 40.sp), child:
          TextButton(onPressed: _skip,
              child: TextCustom('Skip', size: 14.sp,
                  color: const Color(0xFF414141), fontFamily: 'Segoe UI')))
        ]));
  }
  void _skip() {
    if (_lockSkip) {
      // SharedPreferences.getInstance().then((prefs) => prefs.setBool('hasSlide', false));
      // UtilUI.goToPage(context, Constants.showShop ? ShopPage() : MainPage());
      UtilUI.goToPage(context, LoginPage());
    }
  }
}
