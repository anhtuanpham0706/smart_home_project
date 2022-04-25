
import 'package:project_flutter2/component/base_bloc.dart';

class MainBloc extends BaseBloc {
  MainBloc() {
    on<ChangePageMainEvent>((event, emit) =>
        emit(ChangePageMainState(event.index)));
  }
}


class ChangePageMainEvent extends BaseEvent {
  final int index;
  const ChangePageMainEvent(this.index);
}
class ChangePageMainState extends BaseState {
  final int index;
  ChangePageMainState(this.index);
}