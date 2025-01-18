//base
import 'package:bloc/bloc.dart';

//normal base bloc class with specific event type and state type
// abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
//     extends Bloc<BaseEvent, BaseState> {
//   BaseBloc() : super(BaseInitial()) {
//     on<E>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

//generic base bloc class
abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(super.initialState) {
    on<Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
