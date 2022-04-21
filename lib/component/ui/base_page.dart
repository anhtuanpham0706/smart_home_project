import 'package:flutter/material.dart';
import 'package:project_flutter2/component/base_bloc.dart';


class BasePage extends StatefulWidget {
  final BasePageState basePageState;
  const BasePage(this.basePageState, {Key? key}) : super(key: key);

  @override
  BasePageState createState() => basePageState;
}

abstract class BasePageState extends State<BasePage> {
  BaseBloc? bloc;



  @override
  @mustCallSuper
  initState() {
    initBloc();
    super.initState();
    initUI();
  }
  @override
  @mustCallSuper
  dispose() {
    if (bloc != null && !bloc!.isClosed) bloc?.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }



  @protected
  Widget createUI(BuildContext context);

  @protected
  void initBloc();

  @protected
  void initUI();

  void clearFocus() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) FocusManager.instance.primaryFocus?.unfocus();
  }



}
