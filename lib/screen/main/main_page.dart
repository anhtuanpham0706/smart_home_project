import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter2/component/ui/base_page.dart';
import 'package:project_flutter2/screen/home/home_page.dart';
import 'package:project_flutter2/screen/main/main_bloc.dart';




class MainPage extends BasePage {
  MainPage({Key? key}) : super(MainPageState(), key: key);

}


class MainPageState extends BasePageState with WidgetsBindingObserver {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  BasePage? _page;
  MainBloc? _bloc;
  int index = 0;




  @override
  Widget build(BuildContext context, {Color color = Colors.white}) =>
      Container();

  @override
  Widget createUI(BuildContext context) => const SizedBox();


  @override
  void initBloc() {
    int index = 0;
    _bloc = BlocProvider.of<MainBloc>(context);

  }

  @override
  void initUI() {
    // TODO: implement initUI
  }



  BasePage? _getPage() {
    if (_page != null) {
      WidgetsBinding.instance?.removeObserver(this);
      _page = null;
    }
     switch (index) {
    //   case 1:
    //     _page = CartPage(null, funOpenDrawer: _openDrawer,
    //         funLoadCountCart: _loadCountCart, funOpenHomePage: _openHomePage);
    //     break;
    //   case 2:
    //     _page = OrderHistoryPage(_openDrawer, _openHomePage);
    //     break;
    //   case 3:
    //     _page = ProfilePage(_openDrawer);
    //     break;
    //   case 4:
    //     _page = NewsPage(_openDrawer);
    //     break;
    //   case 5:
    //     _page = ChatPage(_openDrawer);
    //     break;
    //   case 6:
    //     _page = TermPolicyPage(openDrawer: _openDrawer);
    //     break;
    //   case 8:
    //     _page = ProductFavoritePage(openDrawer: _openDrawer);
    //     break;
    //   case 9:
    //     _page = ContactPage(_openDrawer);
    //     break;
    //   case 11:
    //     _page = PromotionSelectListPage(null, hasBack: false, openDrawer: _openDrawer);
    //     break;
      default:
       WidgetsBinding.instance?.addObserver(this);
        _page = HomePage();
     }
    return _page;
  }

}