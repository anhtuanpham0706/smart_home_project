import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter2/component/base_bloc.dart';
import 'package:project_flutter2/screen/main/main_bloc.dart';
import 'package:project_flutter2/screen/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 600),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () =>
            MultiBlocProvider(
            providers: [BlocProvider<MainBloc>(create: (context) => MainBloc())],
            child: MaterialApp(home: const SplashPage(),
                key: key, debugShowCheckedModeBanner: false,
                )
        )
    );
  }
}


