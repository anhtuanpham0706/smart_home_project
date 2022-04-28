import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_flutter2/component/ui/base_page.dart';
import 'package:project_flutter2/screen/profile/theme/profile_page_ui.dart';

class ProfilePage extends BasePage {
  // final Function funOpenDrawer;
  ProfilePage({Key? key}) : super(_ProfilePageState(), key: key);

}

class _ProfilePageState extends BasePageState {



  // void _menuClick() => (widget as ProfilePage).funOpenDrawer();

  @override
  Widget build(BuildContext context, {Color color = Colors.white}) =>
      Container(child: ProfilePageUI(), color: color);

  @override
  Widget createUI(BuildContext context) => const SizedBox();

  @override
  void initBloc() {
    // TODO: implement initBloc
  }

  @override
  void initUI() {
    // TODO: implement initUI
  }

}