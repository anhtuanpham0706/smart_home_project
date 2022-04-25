import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter2/screen/home/home_page.dart';
import 'package:project_flutter2/screen/main/main_bloc.dart';
import 'package:project_flutter2/screen/main/ui/main_page_ui.dart';

class MainPageTheme1 extends MainPageUI {
  const MainPageTheme1(user, scaffoldKey, bloc, changePage, getPage, key):
        super(user, scaffoldKey, bloc, changePage, getPage, key:key);



  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    body: Column(
      children: [
        Expanded(child: BlocBuilder(bloc: bloc, builder: (context, state) => getPage(),
            buildWhen: (oldState, newState) => newState is ChangePageMainState)),
        BlocBuilder(
          buildWhen: (oldState, newState) => newState is ChangePageMainState,
          bloc: bloc,
            builder: (context, state) {
          int index = 0;
          if (state is ChangePageMainState) index = state.index;
          // else if (state is ReloadMenuMainState) index = 3;
          if (index == 2) index = 2;
          else if (index == 2 || index == 3) index = index;
          else if (index > 1) index = 0;
           return BottomNavigationBar(
           type: BottomNavigationBarType.fixed,
           currentIndex: index,
           backgroundColor: Colors.white,
           selectedItemColor: Colors.lightBlue,
           unselectedItemColor: const Color(0xFFCACACA),
           onTap: (value) {
           int index = 0;
           if (value == 2) index = 2;
           else if (value > 2) index = 3;
           else index = value;
           changePage(index);
           },
           items: [
           _Item('ic_home', 'Trang chủ'),
           _Item('ic_item_cart', 'Giỏ hàng'),
           // _Item('theme3/ic_theme3_promotion', 'lbl_promotion'),
           _Item('ic_history', 'Lịch sử'), //2
           _Item('theme3/ic_theme3_profile', 'Tài khoản') //3
           ]);
        })
      ],
    ),
  );
}

class _Item extends BottomNavigationBarItem {
  _Item(String icon, String label) : super(
      icon: Image.asset('assets/images/$icon.png',
          width: 20.sp, height: 20.sp, color: const Color(0xFFCACACA)),
      activeIcon: Image.asset('assets/images/$icon.png', width:
      20.sp,
          height: 20.sp, color: Colors.lightBlue), label: label);
}