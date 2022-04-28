import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter2/component/api_client.dart';
import 'package:project_flutter2/component/base_bloc.dart';
import 'package:project_flutter2/component/model/theme_model.dart';
import 'package:project_flutter2/component/multi_language.dart';
import 'package:project_flutter2/component/ui/ecommerce_style.dart';
import 'package:project_flutter2/component/util/util_ui.dart';
import 'package:project_flutter2/screen/home/home_page.dart';
import 'package:project_flutter2/screen/main/main_bloc.dart';
import 'package:project_flutter2/screen/main/main_page.dart';
import 'package:project_flutter2/screen/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static void restartApp(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!.restart();
}
class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  int loading = 0;

  @override
  void initState() {
    super.initState();
    ApiClient.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MultiLanguage.setLanguage().then((value) => _changeState());
    UtilUI.setTheme().then((value) => _changeState());
  }

  void _changeState() {
    loading++;
    if (loading == 2) setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 600),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () =>
            MultiBlocProvider(
            providers: [BlocProvider<MainBloc>(create: (context) => MainBloc())],
            child: MaterialApp(home:  SplashPage(),
                key: key, debugShowCheckedModeBanner: false,
                theme: ThemeData(fontFamily: ThemeModel.font, primaryColor: ECommerceStyle.primaryColor)
                )
        )
    );
  }
  void restart() => setState((){ key = UniqueKey(); });
}


