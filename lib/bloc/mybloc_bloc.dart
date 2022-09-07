import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mybloc_event.dart';
part 'mybloc_state.dart';

class MyblocBloc extends Bloc<MyblocEvent, MyblocState> {
  MyblocBloc() : super(MyblocInitial()) {}

  @override
  Stream<MyblocState> mapEventToState(MyblocEvent event) async* {
    if (event is SubmitForm) {
      yield FormLoading();
      yield FormLoaded();
    } else {
      yield MyblocInitial();
    }
  }
}
