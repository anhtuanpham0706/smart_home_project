import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter2/component/base_bloc.dart';
import 'package:project_flutter2/component/base_response.dart';
import 'package:project_flutter2/component/ui/loading.dart';
import 'package:project_flutter2/component/util/util_ui.dart';


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
  Widget build(BuildContext context,{Color color = Colors.white}) {
    return Scaffold(
        body: GestureDetector(
            onTapDown: (value) => clearFocus(),
            child: Stack(children: [
              Container(color: color, child: createUI(context)),
              BlocBuilder<BaseBloc, BaseState>(
                  bloc: bloc,
                  builder: (context, state) =>
                  state.showLoading ? const Loading() : const SizedBox())
            ])));
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
  bool checkResponse(BaseResponse response, {bool showError = true, bool passString = false}) =>
      UtilUI.checkResponse(context, response, showError: showError, passString: passString);

}
