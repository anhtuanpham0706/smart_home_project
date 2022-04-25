import 'package:flutter/material.dart';
import 'package:project_flutter2/component/ui/base_page.dart';
import 'package:project_flutter2/screen/home/ui/home_page_ui.dart';


class HomePage extends BasePage {
  HomePage({Key? key}) : super (_HomePageState(), key: key);
}



class _HomePageState extends BasePageState {




  @override
  Widget build(BuildContext context, {Color color = Colors.white}) =>
      Container(child: HomePageUI(), color: color);



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