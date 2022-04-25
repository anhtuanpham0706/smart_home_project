import 'package:flutter/src/widgets/framework.dart';
import 'package:project_flutter2/component/ui/base_page.dart';
import 'package:project_flutter2/screen/profile/theme/profile_page_ui.dart';

class ProfilePage extends BasePage {
  final Function funOpenDrawer;
  ProfilePage(this.funOpenDrawer, {Key? key}) : super(_ProfilePageState(), key: key);

}

class _ProfilePageState extends BasePageState {



  void _menuClick() => (widget as ProfilePage).funOpenDrawer();


  @override
  Widget createUI(BuildContext context) {

    return ProfilePageUI();
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
  }

  @override
  void initUI() {
    // TODO: implement initUI
  }

}