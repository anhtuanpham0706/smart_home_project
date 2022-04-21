

import 'package:flutter_bloc/flutter_bloc.dart';

class BaseEvent {
  const BaseEvent();
}



class BaseState {
  final bool showLoading;
  const BaseState({this.showLoading = false});
}


abstract class BaseBloc extends Bloc<BaseEvent,BaseState> {
  BaseBloc({BaseState init = const BaseState()}):super(init);
}

