import 'package:flutter/material.dart';
import 'package:project_flutter2/screen/home/home_page.dart';
import 'package:project_flutter2/screen/main/main_bloc.dart';
import 'package:project_flutter2/screen/main/ui/main_page_theme1.dart';

import '../../../component/model/user_model.dart';






class MainPageUI extends StatelessWidget {
  static int index = 0;
  final UserModel user;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final MainBloc bloc;
  final Function changePage, getPage;

  const MainPageUI(this.user,this.scaffoldKey, this.bloc, this.changePage, this.getPage, {Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MainPageTheme1(user, scaffoldKey, bloc, changePage, getPage, key);
    // switch(ThemeModel.value) {
    //   case ThemeModel.theme3:
    //     return MainPageTheme3(user, scaffoldKey, bloc, changePage, getPage, key);
    //   default:
    //     return MainPageTheme1(user, scaffoldKey, bloc, changePage, getPage, key);
    // }
  }
}